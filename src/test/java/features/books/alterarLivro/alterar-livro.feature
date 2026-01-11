Feature: Atualizar livro do usuário
  Background:
    Given url baseUrl

    Scenario: Atualizar ISBN
      * def isbn = 'isbn'
      * def body =
      """
        {
          "userId": "string",
          "isbn": "string"
        }
      """
      And path '/BookStore/v1/Books/', isbn
      When  method post
      Then status 200

