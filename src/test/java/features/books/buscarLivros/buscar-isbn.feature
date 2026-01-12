Feature: Buscar livro com ISBN

  Background:
    Given url baseUrl

    * call read('classpath:features/books/buscarLivros/buscar-livros.feature')

    @sucesso
    Scenario: Buscar livro por isbn
      And path '/BookStore/v1/Book'
      And param ISBN = livros[0].isbn
      When method get
      Then status 200
      And match response.isbn == livros[0].isbn

      @negative
    Scenario: Buscar livro com isbn inexistente
      And path '/BookStore/v1/Book'
      And param ISBN = "0000000000000"
      When method get
      Then status 400
      And match response.message == "ISBN supplied is not available in Books Collection!"
