from flask import Flask, render_template, request, redirect, url_for
import os
import glob
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import re
import torch
import torch.nn as nn
from transformers import AutoModel, AutoTokenizer
import sys
from openai import OpenAI

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../Pix2Text')))

from pix2text import Pix2Text


device = torch.device('cpu')

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = 'uploads'

if not os.path.exists(app.config['UPLOAD_FOLDER']):
    os.makedirs(app.config['UPLOAD_FOLDER'])

@app.route('/', methods=['GET', 'POST'])
def upload_file():
    extracted_text = ""
    chapter = ""
    similar_problem = ""
    explanation = ""
    if request.method == 'POST':
        if 'file' not in request.files:
            return redirect(request.url)
        file = request.files['file']
        if file.filename == '':
            return redirect(request.url)
        if file:
            filepath = os.path.join(app.config['UPLOAD_FOLDER'], file.filename)
            file.save(filepath)
            problem = image2text(filepath)
            os.remove(filepath)
            chapter = text2chapter(problem)
            similar_problem = text2sim(problem)
            explanation = text2explanation(problem)
    return render_template('index.html', chapter=chapter, similar_problem=similar_problem, explanation=explanation)

p2t = Pix2Text()

total_config = {
    'text_formula': {'languages': ('ko')},
}
p2t = p2t.from_config(total_config=total_config)

def image2text(image_path):
    text = p2t.recognize_text_formula(image_path, file_type='text_formula', return_text=True, auto_line_break=False)
    return text

class SequenceClassificationModel(nn.Module):
    def __init__(self, model_name, num_labels):
        super(SequenceClassificationModel, self).__init__()
        self.automodel = AutoModel.from_pretrained(model_name)
        self.dropout = nn.Dropout(0.1)
        self.classifier = nn.Linear(self.automodel.config.hidden_size, num_labels)

    def forward(self, input_ids, attention_mask):
        outputs = self.automodel(input_ids=input_ids, attention_mask=attention_mask)
        pooled_output = outputs.last_hidden_state[:, 0, :]
        pooled_output = self.dropout(pooled_output)
        logits = self.classifier(pooled_output)
        return logits

model_save_path = "web/model.pt"

model = SequenceClassificationModel("monologg/koelectra-small-v3-discriminator", num_labels=14)
model.load_state_dict(torch.load(model_save_path, map_location=device))
model.to(device)
model.eval()

tokenizer = AutoTokenizer.from_pretrained("monologg/koelectra-small-v3-discriminator")

def predict_unit(text):
    inputs = tokenizer(
        text, 
        return_tensors='pt',
        truncation=True,
        max_length=256,
        padding='max_length',
        add_special_tokens=True
    )

    input_ids = inputs['input_ids'].to(device)
    attention_mask = inputs['attention_mask'].to(device)
    
    with torch.no_grad():
        y_pred = model(input_ids, attention_mask=attention_mask)
    
    _, predicted = torch.max(y_pred, 1)
    
    int_to_label = {0: ' 같은 것이 있는 순열', 1: '원순열', 2: '중복순열', 3: '최단거리로 가는 경우의 수', 4: '방정식의 정수해의 개수', 5: '순열과 조합을 이용한 함수의 개수', 6: '중복조합', 7: '3. 이항정리', 8: '여사건의 확률', 9: '조건부확률', 10: '확률의 덧셈정리', 11: '확률의 뜻과 활용', 12: '연속확률변수', 13: '이산확률변수'}

    predicted_label = int_to_label[predicted.item()]
    
    return predicted_label

def text2chapter(problem):
    prediction = predict_unit(problem)
    return prediction

def read_text_files(directory):
    file_paths = glob.glob(os.path.join(directory, '*.txt'))
    questions = []
    for file_path in file_paths:
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read().strip()
            questions.append(content)
    return questions

def preprocess_texts(texts):
    preprocessed_texts = [text.lower() for text in texts]
    return preprocessed_texts

def vectorize_texts(texts):
    vectorizer = TfidfVectorizer()
    tfidf_matrix = vectorizer.fit_transform(texts)
    return vectorizer, tfidf_matrix

directory_path = 'web/txt'

questions = read_text_files(directory_path)
preprocessed_texts = preprocess_texts(questions)
vectorizer, tfidf_matrix = vectorize_texts(preprocessed_texts)

def find_similar_questions(input_text, vectorizer, tfidf_matrix, top_n=3):
    input_text = input_text.lower()
    input_vec = vectorizer.transform([input_text])
    cosine_sim = cosine_similarity(input_vec, tfidf_matrix).flatten()
    similar_indices = cosine_sim.argsort()[-top_n:][::-1]
    return similar_indices

def text2explanation(problem):
    # 현재 스크립트의 위치에서 Pix2Text 디렉토리로 경로 설정
    sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../MACM')))

    from main import main
    n = 1 # verification times
    times = 2 # The upper limit of the mining times
    min_voters = 1 # min number of voters
    max_voters = 3 # max number of voters

    information = main(problem, times, n, min_voters, max_voters)

    return info2explain(problem, information)

def info2explain(problem, information):
    client = OpenAI()
    
    assistant_id = "asst_e856EaN6nDZ8G7B7oHtYhGla"

    thread = client.beta.threads.create()

    thread_message = client.beta.threads.messages.create(
        thread_id=thread.id,
        role="user",
        content=f"문제:{problem}, 풀이 정보:{information}",
    ) 

    run = client.beta.threads.runs.create_and_poll(
        thread_id=thread.id,
        assistant_id=assistant_id,
    )

    messages = list(client.beta.threads.messages.list(thread_id=thread.id, run_id=run.id))

    message_content = messages[0].content[0].text

    return message_content.value

def text2sim(problem):
    input_text = problem
    similar_indices = find_similar_questions(input_text, vectorizer, tfidf_matrix)
    formatted_questions = []
    for idx in similar_indices:
        formatted_text = questions[idx]
        formatted_questions.append(formatted_text)
        break
    return formatted_questions[0]

if __name__ == '__main__':
    app.run(debug=True)