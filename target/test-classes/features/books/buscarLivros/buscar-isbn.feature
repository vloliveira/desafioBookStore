Feature: Buscar livro pelo ISBN

  Background:
    Given url baseUrl

    * call read('classpath:features/books/buscarLivros/buscar-livros.feature')

    Scenario: Buscar livro
      And path '/BookStore/v1/Book'
      And param ISBN = livros[0].isbn
      When method get
      Then status 200
      And match response.isbn == livros[0].isbn
