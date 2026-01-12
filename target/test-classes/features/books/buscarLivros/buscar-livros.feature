Feature: Buscar todos os livros
  Background:
    Given url baseUrl

    Scenario: Buscar livros

      Given path '/BookStore/v1/Books'
      When method get
      Then status 200
      And match response == read('classpath:features/books/buscarLivros/buscar-livros.json')

      * def livros = response.books