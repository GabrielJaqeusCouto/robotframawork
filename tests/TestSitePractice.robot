*** Settings ***
Resource       ../resource/Resource.robot
Test Setup     Abrir navegador
Test Teardown  Fechar navegador

### SETUP ele roda keyword antes da suite ou antes de um teste
### TEARDOWN ele roda keyword depois da suite ou depois de um teste

*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
  Acessar a pagina home do site
  Digitar o nome do produto "Blouse" no campo de pesquisa
  Clicar no botão de pesquisar
  Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não exixstente
  Acessar a pagina home do site
  Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
  Clicar no botão de pesquisar
  Conferir mensagem de erro "No results were found for your search "itemNãoExistente""

*** Keywords ***
