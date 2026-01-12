Feature: Atualizar livro do usuário
  Background:
    Given url baseUrl

    * call read('classpath:features/books/adicionarLivro/adicionar-livro.feature')
    * call read('classpath:features/books/buscarLivros/buscar-livros.feature')

    Scenario: Atualizar ISBN

      * print 'Este é o livro ' +  isbnAdicionado
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
      And path '/BookStore/v1/Books/', isbnAdicionado
      And request body
      When method put
      Then status 200

