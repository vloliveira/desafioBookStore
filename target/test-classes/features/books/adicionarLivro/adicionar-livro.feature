Feature: Adicionar livro ao usuario
  Background:
    Given url baseUrl

      * call read('classpath:features/gerarToken/auth.feature@sucesso')
      * call read('classpath:features/books/buscarLivros/buscar-livros.feature')

    @sucesso
    Scenario: Adicionar livro com dados válidos

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

    @negative
    Scenario: Adicionar livro com isbn inválido

      * def livro = response.books[0].isbn
      * header Authorization = 'Bearer ' + token
      * def listaParaExportar = response.books

      * def body =
        """
        {
          "userId": "#(usuarioId)",
          "collectionOfIsbns": [
            {
              "isbn": "1234567890123"
            }
          ]
        }
        """
      And path '/BookStore/v1/Books'
      And request body
      When method post
      Then status 400








