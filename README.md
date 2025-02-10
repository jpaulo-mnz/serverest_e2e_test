# 📌 **Projeto: Automação de Testes com Robot Framework**

## 🎯 **Objetivo do Projeto**
Este projeto tem como objetivo automatizar testes de **Front-End** e **Back-End**, garantindo maior eficiência na validação das funcionalidades do sistema, utilizando boas práticas de desenvolvimento de testes automatizados. Por se tratar de um projeto basico, as features escolhidas para automação foi a de cadastro de usuarios, tanto no front como no back.

---

## 📚 **Embasamento Técnico**
A automação de testes foi desenvolvida com base nos conceitos do **ISTQB** (*International Software Testing Qualifications Board*), focando em **fundamentos de testes de software** e **automação de testes**.

---

## 🔍 **Abordagem de Testes**
Foi utilizada a metodologia **BDD** (*Behavior-Driven Development*), adotando a linguagem direta para descrever o comportamento do usuario dentro do sistema, usando palavras de ordem como "Acessa", "Escolhe", e "Vai para..", essa escolha foi feita para descrever os cenários de teste de forma clara e compreensível para todas as partes interessadas.

---

## 🤖 **Estratégia de Automação**
A automação de testes foi implementada seguindo princípios de **Clean Code**, visando alta **manutenibilidade, reuso e simplicidade**. Para isso, foram adotadas as seguintes estratégias:

### 📌 **PageObjects ➞ Automação Front-End**
- Melhor abstração da interface do usuário.
- Reusabilidade e manutenção simplificada.
- Separação de responsabilidades.

### 📌 **Custom Commands ➞ Automação Back-End**
- Facilidade na execução de ações repetitivas.
- Padronização das funcionalidades.
- Maior legibilidade e reutilização de lógica de teste.

---

## 📊 **Resumo dos Testes**
A automação de testes está dividida entre **cenários de sucesso** e **cenários de falha**.  
Cada teste pode ser executado de forma **isolada** ou **em conjunto**.

| 🔍 Teste  | Cenários de Sucesso | Cenários de Falha |
|-----------|---------------------|-------------------|
| 💡 **Front-End**  | 2                     | 2                 |
| 🔌 **Back-End**  | 2                     | 2                 |

---

## ⚙️ **Tecnologias Utilizadas**
- **Python** → Linguagem principal do projeto.
- **Robot Framework** → Framework para automação de testes.
- **SeleniumLibrary** → Automação de testes de interface gráfica.
- **RequestsLibrary** → Automação de testes de API.
- **FakerLibrary** → Geração de dados aleatórios para os testes.

---

## 📋 **Requisitos Básicos**

### **📌 Ferramentas Necessárias**
- **Python** (versão 3.12.6 ou superior)
- **Robot Framework** (versão 7.2.2 ou superior)

### **📌 Configuração do Arquivo de Variáveis**
Para garantir segurança, os dados sensíveis **não estão no código-fonte**, sendo configurados no arquivo **`variables.robot`**.

**Crie um arquivo `variables.robot` dentro da pasta `resources/` e configure conforme necessário:**
```robot
*** Variables ***
# FRONT-END
${URL}                   https://url.aqui/
${BROWSER}               Chrome
${PASSWORD_DATA}         suasenha
${SUCCESS_MSG_DATA}      Cadastro realizado com sucesso
${ERROR_MSG_DATA}        Este email já está sendo usado

# BACK-END
${BASE_URL}              https://api.dev
${ENDPOINT}              /endpoint
```
📌 **Nota:** Essa abordagem foi adotada para evitar compartilhamento de dados sensíveis através do código.

---

## 🚩 **Processo de Instalação**

### ✅ **1. Instalar o Python**
#### Para MacOS (usando Homebrew)
```sh
brew install python3
```
#### Para Linux (Ubuntu/Debian)
```sh
sudo apt update && sudo apt install python3 python3-pip
```
#### Para Windows (usando Chocolatey)
```sh
choco install python
```
📌 **Verifique a instalação:**
```sh
python3 --version
pip --version
```

---

### ✅ **2. Criar e Ativar um Ambiente Virtual**
```sh
python3 -m venv venv
source venv/bin/activate  # Para Mac/Linux
venv\Scripts\activate      # Para Windows
```

---

### ✅ **3. Instalar as Dependências**
```sh
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-requests
pip install robotframework-faker
pip install webdriver-manager
```

---

### ✅ **4. Instalar WebDrivers para Selenium**
#### 🟢 **Google Chrome**
```sh
brew install chromedriver  # MacOS
sudo apt install chromium-chromedriver  # Linux
winget install Google.ChromeDriver  # Windows
```
#### 🟢 **GeckoDriver (Firefox)**
```sh
brew install geckodriver  # MacOS
sudo apt install firefox-geckodriver  # Linux
winget install Mozilla.GeckoDriver  # Windows
```
📌 **Verifique a instalação:**
```sh
chromedriver --version
geckodriver --version
```

---

## 🚀 **Passos para Executar os Testes**
Após configurar o ambiente e instalar as dependências, **execute os testes com os seguintes comandos:**

### ✅ **Executar os Testes de Front-End**
```sh
robot tests/front_end_cadastro.robot
```

### ✅ **Executar os Testes de Back-End**
```sh
robot tests/back_end_cadastro.robot
```

---
