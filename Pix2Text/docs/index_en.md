<figure markdown>
![Pix2Text](figs/p2t-logo.png){: style="width:180px"}
</figure>

# Pix2Text (P2T)
[![Discord](https://img.shields.io/discord/1200765964434821260?label=Discord)](https://discord.gg/GgD87WM8Tf)
[![Downloads](https://static.pepy.tech/personalized-badge/pix2text?period=total&units=international_system&left_color=grey&right_color=orange&left_text=Downloads)](https://pepy.tech/project/pix2text)
[![Visitors](https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fpix2text.readthedocs.io%2Fzh-cn%2Fstable%2F&label=Visitors&countColor=%23f5c791&style=flat&labelStyle=none)](https://visitorbadge.io/status?path=https%3A%2F%2Fpix2text.readthedocs.io%2Fzh-cn%2Fstable%2F)
[![license](https://img.shields.io/github/license/breezedeus/pix2text)](./LICENSE)
[![PyPI version](https://badge.fury.io/py/pix2text.svg)](https://badge.fury.io/py/pix2text)
[![forks](https://img.shields.io/github/forks/breezedeus/pix2text)](https://github.com/breezedeus/pix2text)
[![stars](https://img.shields.io/github/stars/breezedeus/pix2text)](https://github.com/breezedeus/pix2text)
![last-release](https://img.shields.io/github/release-date/breezedeus/pix2text)
![last-commit](https://img.shields.io/github/last-commit/breezedeus/pix2text)
[![Twitter](https://img.shields.io/twitter/url?url=https%3A%2F%2Ftwitter.com%2Fbreezedeus)](https://twitter.com/breezedeus)

<figure markdown>
[📖 Usage](usage.md) |
[🛠️ Install](install.md) |
[🧳 Models](models.md) |
[🛀🏻 Demo](demo.md) |
[💬 Contact](contact.md)

[中文](index.md) | English
</figure>

**Pix2Text (P2T)** aims to be a **free and open-source Python** alternative to **[Mathpix](https://mathpix.com/)**, and it can already accomplish **Mathpix**'s core functionality. **Pix2Text (P2T) can recognize layouts, tables, images, text, mathematical formulas, and integrate all of these contents into Markdown format. P2T can also convert an entire PDF file (which can contain scanned images or any other format) into Markdown format.**

**Pix2Text (P2T)** integrates the following models:

- **Layout Analysis Model**: [breezedeus/pix2text-layout](https://huggingface.co/breezedeus/pix2text-layout) ([Mirror](https://hf-mirror.com/breezedeus/pix2text-layout)).
- **Table Recognition Model**: [breezedeus/pix2text-table-rec](https://huggingface.co/breezedeus/pix2text-table-rec) ([Mirror](https://hf-mirror.com/breezedeus/pix2text-table-rec)).
- **Text Recognition Engine**: Supports **80+ languages** such as **English, Simplified Chinese, Traditional Chinese, Vietnamese**, etc. For English and Simplified Chinese recognition, it uses the open-source OCR tool [CnOCR](https://github.com/breezedeus/cnocr), while for other languages, it uses the open-source OCR tool [EasyOCR](https://github.com/JaidedAI/EasyOCR).
- **Mathematical Formula Detection Model (MFD)**: [breezedeus/pix2text-mfd](https://huggingface.co/breezedeus/pix2text-mfd) ([Mirror](https://hf-mirror.com/breezedeus/pix2text-mfd)). Implemented based on [CnSTD](https://github.com/breezedeus/cnstd).
- **Mathematical Formula Recognition Model (MFR)**: [breezedeus/pix2text-mfr](https://huggingface.co/breezedeus/pix2text-mfr) ([Mirror](https://hf-mirror.com/breezedeus/pix2text-mfr)).

Several models are contributed by other open-source authors, and their contributions are highly appreciated. 

<figure markdown>
![Pix2Text Architecture Flow](figs/arch-flow.jpg)
</figure>

For detailed explanations, please refer to the [Models](models.md).

As a Python3 toolkit, P2T may not be very user-friendly for those who are not familiar with Python. Therefore, we also provide a **[free-to-use P2T Online Web](https://p2t.breezedeus.com)**, where you can directly upload images and get P2T parsing results. The web version uses the latest models, resulting in better performance compared to the open-source models.

Welcome to join [**Pix2Text Discord Server**](https://discord.gg/GgD87WM8Tf), if you have any questions or suggestions.

If you're interested, feel free to add the WeChat assistant as a friend by scanning the QR code and mentioning `p2t`. The assistant will regularly invite everyone to join the group where the latest developments related to P2T tools will be announced:

<figure markdown>
![Wechat-QRCode](figs/wx-qr-code.JPG){: style="width:300px"}
</figure>

The author also maintains a **Knowledge Planet** [**P2T/CnOCR/CnSTD Private Group**](https://t.zsxq.com/FEYZRJQ), where questions are answered promptly. You're welcome to join. The **knowledge planet private group** will also gradually release some private materials related to P2T/CnOCR/CnSTD, including **some unreleased models**, **discounts on purchasing premium models**, **code snippets for different application scenarios**, and answers to difficult problems encountered during use. The planet will also publish the latest research materials related to P2T/OCR/STD.

For more contact method, please refer to [Contact](contact.md).


## List of Supported Languages

The text recognition engine of Pix2Text supports **`80+` languages**, including **English, Simplified Chinese, Traditional Chinese, Vietnamese**, etc. Among these, **English** and **Simplified Chinese** recognition utilize the open-source OCR tool **[CnOCR](https://github.com/breezedeus/cnocr)**, while recognition for other languages employs the open-source OCR tool **[EasyOCR](https://github.com/JaidedAI/EasyOCR)**. Special thanks to the respective authors.

List of **Supported Languages** and **Language Codes** are shown below:

<details>
<summary>↓↓↓ Click to show details ↓↓↓</summary>

| Language            | Code Name   |
| ------------------- | ----------- |
| Abaza               | abq         |
| Adyghe              | ady         |
| Afrikaans           | af          |
| Angika              | ang         |
| Arabic              | ar          |
| Assamese            | as          |
| Avar                | ava         |
| Azerbaijani         | az          |
| Belarusian          | be          |
| Bulgarian           | bg          |
| Bihari              | bh          |
| Bhojpuri            | bho         |
| Bengali             | bn          |
| Bosnian             | bs          |
| Simplified Chinese  | ch_sim      |
| Traditional Chinese | ch_tra      |
| Chechen             | che         |
| Czech               | cs          |
| Welsh               | cy          |
| Danish              | da          |
| Dargwa              | dar         |
| German              | de          |
| English             | en          |
| Spanish             | es          |
| Estonian            | et          |
| Persian (Farsi)     | fa          |
| French              | fr          |
| Irish               | ga          |
| Goan Konkani        | gom         |
| Hindi               | hi          |
| Croatian            | hr          |
| Hungarian           | hu          |
| Indonesian          | id          |
| Ingush              | inh         |
| Icelandic           | is          |
| Italian             | it          |
| Japanese            | ja          |
| Kabardian           | kbd         |
| Kannada             | kn          |
| Korean              | ko          |
| Kurdish             | ku          |
| Latin               | la          |
| Lak                 | lbe         |
| Lezghian            | lez         |
| Lithuanian          | lt          |
| Latvian             | lv          |
| Magahi              | mah         |
| Maithili            | mai         |
| Maori               | mi          |
| Mongolian           | mn          |
| Marathi             | mr          |
| Malay               | ms          |
| Maltese             | mt          |
| Nepali              | ne          |
| Newari              | new         |
| Dutch               | nl          |
| Norwegian           | no          |
| Occitan             | oc          |
| Pali                | pi          |
| Polish              | pl          |
| Portuguese          | pt          |
| Romanian            | ro          |
| Russian             | ru          |
| Serbian (cyrillic)  | rs_cyrillic |
| Serbian (latin)     | rs_latin    |
| Nagpuri             | sck         |
| Slovak              | sk          |
| Slovenian           | sl          |
| Albanian            | sq          |
| Swedish             | sv          |
| Swahili             | sw          |
| Tamil               | ta          |
| Tabassaran          | tab         |
| Telugu              | te          |
| Thai                | th          |
| Tajik               | tjk         |
| Tagalog             | tl          |
| Turkish             | tr          |
| Uyghur              | ug          |
| Ukranian            | uk          |
| Urdu                | ur          |
| Uzbek               | uz          |
| Vietnamese          | vi          |


> Ref: [Supported Languages](https://www.jaided.ai/easyocr/) .

</details>


## Online Service

Everyone can use the **[P2T Online Service](https://p2t.breezedeus.com)** for free, with a daily limit of 10,000 characters per account, which should be sufficient for normal use. *Please refrain from bulk API calls, as machine resources are limited, and this could prevent others from accessing the service.*

Due to hardware constraints, the Online Service currently only supports **Simplified Chinese** and **English** languages. To try the models in other languages, please use the following **Online Demo**.



## Online Demo 🤗

You can also try the **[Online Demo](https://huggingface.co/spaces/breezedeus/Pix2Text-Demo)** ([Mirror](https://hf-mirror.com/spaces/breezedeus/Pix2Text-Demo)) to see the performance of **P2T** in various languages. However, the online demo operates on lower hardware specifications and may be slower. For Simplified Chinese or English images, it is recommended to use the **[P2T Online Service](https://p2t.breezedeus.com)**.


## Install

Well, one line of command is enough if it goes well.

```bash
pip install pix2text
```

If you need to recognize languages other than **English** and **Simplified Chinese**, please use the following command to install additional packages:

```bash
pip install pix2text[multilingual]
```



If the installation is slow, you can specify a domestic installation source, such as using the Aliyun source:

```bash
pip install pix2text -i https://mirrors.aliyun.com/pypi/simple
```


If it is your first time to use **OpenCV**, then probably  the installation will not be very easy.  Bless.

**Pix2Text** mainly depends on [**CnSTD>=1.2.1**](https://github.com/breezedeus/cnstd), [**CnOCR>=2.2.2.1**](https://github.com/breezedeus/cnocr), and [**transformers>=4.37.0**](https://github.com/huggingface/transformers). If you encounter problems with the installation, you can also refer to their installation instruction documentations.


> **Warning**
>
> If you have never installed the `PyTorch`, `OpenCV` python packages before, you may encounter a lot of problems during the first installation, but they are usually common problems that can be solved by Baidu/Google.

For more instructions, please refer to [Install](install.md) .

## Usage

Refer to: [Usage](usage.md).

## Examples

Refer to: [Examples](examples.md).

## Model Downloads

Refer to: [Models](models.md).

## Command Line Tools

Refer to: [Command Line Tools](command.md).

## HTTP Service

To start an HTTP service for receiving images (currently does not support PDF) and returning recognition results, use the command **`p2t serve`**.

```bash
p2t serve -l en,ch_sim -H 0.0.0.0 -p 8503
```

Afterwards, you can call the service using curl:

```bash
curl -X POST \
  -F "file_type=page" \
  -F "resized_shape=768" \
  -F "embed_sep= $,$ " \
  -F "isolated_sep=$$\n, \n$$" \
  -F "image=@docs/examples/page2.png;type=image/jpeg" \
  http://0.0.0.0:8503/pix2text
```

For more information, refer to [Command/Starting the Service](command.md).

## MacOS Desktop Application

Please refer to [Pix2Text-Mac](https://github.com/breezedeus/Pix2Text-Mac) for installing the Pix2Text Desktop App for MacOS.

<div align="center">
  <img src="https://github.com/breezedeus/Pix2Text-Mac/raw/main/assets/on_menu_bar.jpg" alt="Pix2Text Mac App" width="400px"/>
</div>


## A cup of coffee for the author

It is not easy to maintain and evolve the project, so if it is helpful to you, please consider [offering the author a cup of coffee 🥤](https://www.breezedeus.com/buy-me-coffee).

---

Official code base: [https://github.com/breezedeus/pix2text](https://github.com/breezedeus/pix2text). Please cite it properly.

For more information on Pix2Text (P2T), visit: [https://www.breezedeus.com/article/pix2text](https://www.breezedeus.com/article/pix2text).
