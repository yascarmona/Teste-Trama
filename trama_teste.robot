*** Settings ***
Documentation    Essa suíte testa o site da Trama
Resource         trama_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador



*** Test Cases ***
CT1 - Cadastro de conta com CPF invalido
	[Documentation]    Esse teste verifica o login de um usuario ativo
	[Tags]             cadastro_CPFInvalido
	Acessar a pagina home do site
    Clicar no Botão de Login
	Entrar na Aba "AINDA NÃO TENHO UMA CONTA"
    Preencher dados válidos uma nova conta, mas inserir no campo "CPF" numeros invalidos.
	Verificar Impedimento de Cadastro


CT2 - Realizar Login
    [Documentation]    Esse teste verifica o login de um usuario ativo
	[Tags]             cadastro_CPFInvalido
	Acessar a pagina home do site
    Clicar no Botão de Login
	Selecionar Campo "Empresa"
	Inserir credencias requeridas (CNPJ e senha) ja cadastradas no banco
	Clicar em "Entrar"
	Verificar se o título da página


