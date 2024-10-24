*** Settings ***
Library	SeleniumLibrary
Library    Screenshot

*** Variables ***
${BROWSER}	chrome 
${URL}		http://localhost/trama/SemLogin/index.html
${NOME}    Guilherme
${SOBRENOME}    Belo
${CPF}    12345678910
${TELEFONE}	41985108854
${EMAIL}	gui@belo
${SENHA}	Senha@1234
${MENSAGEM_FALHA_LOGIN}    CPF inválido!
${CNPJ}    98.509.568/0001-37
${TITULO}    FORMULÁRIO DE INSERÇÃO DE PRODUTO


*** Keywords ***
Abrir o navegador
	Open Browser	browser=${BROWSER}
	Maximize Browser Window

Fechar o navegador
    Sleep    2
	Close Browser
Verificar Impedimento de Cadastro
    Take Screenshot    evidencia
Acessar a pagina home do site
	Go To	url=${URL}

Clicar no Botão de Login
    Click Element    xpath://a[@href='../Login/login.html']
Entrar na Aba "AINDA NÃO TENHO UMA CONTA"
    Click Element    xpath://a[@href='../Cadastro/cadastro.html']  

Preencher dados válidos uma nova conta, mas inserir no campo "CPF" numeros invalidos. 
    Input Text    xpath://input[@id='nome']       ${NOME}
    Input Text    xpath://input[@id='sobrenome']  ${SOBRENOME}
    Input Text    xpath://input[@id='email']      ${EMAIL}
    Input Text    xpath://input[@id='tel']   ${TELEFONE}
    Input Text    xpath://input[@id='senha']      ${SENHA}
    Input Text    xpath://input[@id='cpf']        ${CPF}
    Click Button  xpath://input[@type='submit' and @value='Enviar']

Verificar mensagem de falha no login
	${MENSAGEM_TELA}=	Get webElement	id:toast-container
	Should Contain	${MENSAGEM_TELA.text}	${MENSAGEM_FALHA_LOGIN}

Selecionar Campo "Empresa"
    Click Element    xpath://input[@id='empresa']

Inserir credencias requeridas (CNPJ e senha) ja cadastradas no banco
    Input Text    xpath://input[@id='cnpj']        ${CNPJ}
    Input Text    xpath://input[@id='senha']      ${SENHA}

Clicar em "Entrar"
    Click Button  xpath://input[@value='ENTRAR']

Verificar se o título da página 
    Title Should Be    title=${TITULO}