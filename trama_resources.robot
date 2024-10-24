*** Settings ***
Library	SeleniumLibrary
Library    Screenshot

*** Variables ***
${BROWSER}	chrome 
${URL}		http://localhost/trama/SemLogin/index.html
${NOME}    Yasmin
${SOBRENOME}    Carmona
${CPF}    420.298.938-46
${CNPJ}    27.471.043/0001-01
${SENHA}	senha@1234
${SENHAHASH}    $2y$10$B6Twp16PmE/kYA.YBi
${TITULO}     PRODUTO
${TITULO2}  FORMULÁRIO DE INSERÇÃO DE PRODUTO
${PRECO}    80
${PRODUTO}    Blusa
${IMG_SRC}    ../uploads/

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

Verificar se o título da página é FORMULÁRIO DE INSERÇÃO DE PRODUTO
    Title Should Be    title=${TITULO2}

Selecionar Campo "Empresa"
    Click Element    xpath://input[@id='empresa']

Inserir credencias requeridas (CNPJ e senha) ja cadastradas no banco
    Input Text    xpath://input[@id='cnpj']        ${CNPJ}
    Input Text    xpath://input[@id='senha']      ${SENHAHASH}


Preencher dados válidos para o novo produto menos a imagem
    Input Text    xpath://input[@id='nome']    ${NOME}
    Input Text    xpath://input[@id='marca']   ${PRODUTO}
    Input Text    xpath://input[@id='preco']   ${PREÇO}
    Input Text    xpath://input[@id='descricao']  Blusa feminina de algodão
    Click Button    xpath://input[@type='submit' and @value='Inserir Produto']


Clicar em "Seus Produtos"
    Click Button  xpath:/html/body/header/a[1]/button


Verificar o valor do src da imagem
    ${src}=    Get Element Attribute    xpath=/html/body/div/div/div[3]/img    src
    Should Not Be Equal    ${src}    ${IMG_DEFAULT_SRC}
    Take a Screenshot