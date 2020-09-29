*** Settings ***
Library        SeleniumLibrary
### tudo que tiver a palavra Should é uma conferencia no selenium

*** Variables ***
${URL}  http://automationpractice.com
${BROWSER}  chrome

*** Keywords ***
Abrir navegador
  Open Browser   ${URL}  ${BROWSER}

Fechar navegador
  Close Browser

### Passo-a-passo
Acessar a pagina home do site
  Title Should Be    My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
  Input Text    id=search_query   ${PRODUTO}

Clicar no botão de pesquisar
  Click Element    name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
  Wait Until Element Is Visible    css=#center_column > h1
  Title Should Be    Search - My Store
  Page Should Contain Image   xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
  Page Should Contain Link    xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"Blouse")]

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
  Wait Until Element Is Visible    xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
  Element Text Should Be    xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERTA}
