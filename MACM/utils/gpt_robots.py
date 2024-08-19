import os
from openai import OpenAI
os.environ["OPENAI_API_KEY"] = "" # Enter your OpenAi Key
client = OpenAI()

   
def generate_from_thinker(prompts, max_tokens, model="gpt-4o-mini-2024-07-18", temperature=0.7, n=1):
    assistant_id = "asst_uCFEy28ddZclnv5r27LYeqvv"

    thread = client.beta.threads.create()
    for i in range(len(prompts)):   
        message = prompts[i]["content"]

        thread_message = client.beta.threads.messages.create(
            thread_id=thread.id,
            role="user",
            content=message,
        ) 
        
        run = client.beta.threads.runs.create(
            thread_id=thread.id,
            assistant_id=assistant_id,
        )      
        while run.status in ["queued", "in_progress"]:
            keep_retrieving_run = client.beta.threads.runs.retrieve(
                thread_id=thread.id,
                run_id=run.id
            )
            
            if keep_retrieving_run.status == "completed":
                # print("\n")

                all_messages = client.beta.threads.messages.list(
                    thread_id=thread.id
                )
                # print(f"all_messages:\n{all_messages}")
                
                try:
                    Assistant_response = all_messages.data[0].content[0].text.value
                except Exception as e:
                    print(f"An error occurred: {e}") # Avoid the image outputs
                    Assistant_response = "I need to rethink this problem."
                break

            elif keep_retrieving_run.status == "queued" or keep_retrieving_run.status == "in_progress":
                pass
            else:
                print(f"Run status: {keep_retrieving_run.status}")
                break
    return Assistant_response  
        


def generate_from_judge(prompts, max_tokens, model="gpt-4o-mini-2024-07-18", temperature=0.7, n=1):

    assistant_id = "asst_zrvpjAEXQ18QWZVRCaPNma0o"

    thread = client.beta.threads.create()
    for i in range(len(prompts)):   
        message = prompts[i]["content"]

        thread_message = client.beta.threads.messages.create(
            thread_id=thread.id,
            role="user",
            content=message,
        ) 
        
        run = client.beta.threads.runs.create(
            thread_id=thread.id,
            assistant_id=assistant_id,
        )      
        while run.status in ["queued", "in_progress"]:
            keep_retrieving_run = client.beta.threads.runs.retrieve(
                thread_id=thread.id,
                run_id=run.id
            )
            
            if keep_retrieving_run.status == "completed":
                # print("\n")

                all_messages = client.beta.threads.messages.list(
                    thread_id=thread.id
                )
                # print(f"all_messages:\n{all_messages}")
                
                try:
                    Assistant_response = all_messages.data[0].content[0].text.value
                except Exception as e:
                    print(f"An error occurred: {e}") # Avoid the image outputs
                    Assistant_response = "False"
                break

            elif keep_retrieving_run.status == "queued" or keep_retrieving_run.status == "in_progress":
                pass
            else:
                print(f"Run status: {keep_retrieving_run.status}")
                break
    return Assistant_response



def generate_from_excutor(prompts, max_tokens, model="gpt-4o-mini-2024-07-18", temperature=0.7, n=1):
    assistant_id = "asst_FOC3j1pn3INuCHFPM790qaql"

    thread = client.beta.threads.create()
    for i in range(len(prompts)):   
        message = prompts[i]["content"]

        thread_message = client.beta.threads.messages.create(
            thread_id=thread.id,
            role="user",
            content=message,
        ) 
        
        run = client.beta.threads.runs.create(
            thread_id=thread.id,
            assistant_id=assistant_id,
        )      
        while run.status in ["queued", "in_progress"]:
            keep_retrieving_run = client.beta.threads.runs.retrieve(
                thread_id=thread.id,
                run_id=run.id
            )
            
            if keep_retrieving_run.status == "completed":
                # print("\n")

                all_messages = client.beta.threads.messages.list(
                    thread_id=thread.id
                )
                # print(f"all_messages:\n{all_messages}")
                
                try:
                    Assistant_response = all_messages.data[0].content[0].text.value
                except Exception as e:
                    print(f"An error occurred: {e}") # Avoid the image outputs
                    Assistant_response = "False"
                break

            elif keep_retrieving_run.status == "queued" or keep_retrieving_run.status == "in_progress":
                pass
            else:
                print(f"Run status: {keep_retrieving_run.status}")
                break
    return Assistant_response

