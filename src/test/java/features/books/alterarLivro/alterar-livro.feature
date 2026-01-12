Feature: Atualizar livro do usuário
  Background:
    Given url baseUrl

    * call read('classpath:features/books/adicionarLivro/adicionar-livro.feature@sucesso')
    * call read('classpath:features/books/buscarLivros/buscar-livros.feature')

    Scenario: Atualizar ISBN

      * print 'Este é o livro ' +  livro
      * def isbnNovo = livros[1].isbn

      * print 'Este é o novo livro' + isbnNovo

      * header Authorization = 'Bearer ' + token
      * def body =
      """
        {
          "userId": "#(usuarioId)",
          "isbn": "#(isbnNovo)"
        }
      """
      And path '/BookStore/v1/Books/', livro
      And request body
      When method put
      Then status 200

    Scenario: Atualizar ISBN incorreto

      * print 'Este é o livro ' +  livro
      * def isbnNovo = livros[1].isbn

      * print 'Este é o novo livro' + isbnNovo

      * header Authorization = 'Bearer ' + token
      * def body =
        """
          {
            "userId": "#(usuarioId)",
            "isbn": "1234567890123"
          }
        """
      And path '/BookStore/v1/Books/', livro
      And request body
      When method put
      Then status 400

