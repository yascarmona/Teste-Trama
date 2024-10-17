*** Settings ***
Library	SeleniumLibrary
Library    Screenshot

*** Variables ***
${BROWSER}	chrome 
${URL}		http://localhost/trama/SemLogin/index.html
${NOME}    Yasmin
${SOBRENOME}    Carmona
${CPF}    42029893846
${CNPJ}    98.509.568/0001-37
${SENHA}	senha@1234
${SENHAHASH}    $2y$10$7yV6LQE5BalsmA3QQL
${TITULO}     PRODUTO
${PREÇO}     
${PRODUTO}     "Blusa"

*** Keywords ***
Abrir o navegador
	Open Browser	browser=${BROWSER}
	Maximize Browser Window

Fechar o navegador
    Sleep    2
	Close Browser
Acessar a pagina home page do site Trama
	Go To	url=${URL}

Acessar a pagina de login do sistema
    Click Element    xpath://a[@href='../Login/login.html']


Selecionar Campo "Cliente"
    Click Element    xpath://input[@id='cliente']


Inserir credencias requeridas (CPF e senha) ja cadastradas no banco
    Input Text    xpath://input[@id='cpf']        ${CPF}
    Input Text    xpath://input[@id='senha']      ${SENHA}

Clicar em "Entrar"
    Click Button  xpath://input[@value='ENTRAR']

Verificar se o título da página é produto
    Title Should Be    title=${TITULO}
    Take Screenshot    evidencia

Selecionar Campo "Empresa"
    Click Element    xpath://input[@id='empresa']

Inserir credencias requeridas (CNPJ e senha) ja cadastradas no banco
    Input Text    xpath://input[@id='cnpj']        ${CNPJ}
    Input Text    xpath://input[@id='senha']      ${SENHAHASH}


Preencher dados válidos para o novo produto
    Input Text    xpath://input[@id='nome']       ${NOME}
    Input Text    xpath://input[@id='marca']  ${MARCA}
    Input Text    xpath://input[@id='preco']      ${PRECO}
    Input Text    xpath://input[@id='descricao']   ${DESCRICAO}
    Input Text    xpath://input[@id='imagem']      ${IMAGEM}
    Click Button  xpath://input[@type='submit' and @value='Inserir Produto']