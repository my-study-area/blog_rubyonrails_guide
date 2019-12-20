# language: pt

@javascript
Funcionalidade: Listar artigos

-Eu como visitante
-Eu quero visualizar os artigos do Blog

Cenario: Visualizar os artigos
  Dado Eu possuo 5 artigos cadastrados
  Quando eu acesso a pagina de artigos
  Entao eu visualizo os 5 artigos
