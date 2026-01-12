Feature: Buscar todos os livros
  Background:
    Given url baseUrl

    Scenario:

      Given path '/BookStore/v1/Books'
      When method get
      Then status 200

      * def livros = response.books

