Feature: Adicionar livro ao usuario
  Background:
    Given url baseUrl

      * call read('classpath:features/gerarToken/auth.feature')
      * call read('classpath:features/books/buscarLivros/buscar-livros.feature')

    Scenario: Adicionar livro

      * def livro = response.books[0].isbn
      * header Authorization = 'Bearer ' + token
      * def listaParaExportar = response.books

      * def body =
      """
      {
        "userId": "#(usuarioId)",
        "collectionOfIsbns": [
          {
            "isbn": "#(livro)"
          }
        ]
      }
      """
      And path '/BookStore/v1/Books'
      And request body
      When method post
      Then status 201


      * def isbnAdicionado = response.books[0].isbn




