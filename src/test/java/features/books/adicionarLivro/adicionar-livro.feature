Feature: Adicionar livro ao usuario
  Background:
    Given url baseUrl

    Scenario: Adicionar livro
      And path '/BookStore/v1/Books'

      * def body =
      """
      {
        "userId": "string",
        "collectionOfIsbns": [
          {
            "isbn": "string"
          }
        ]
      }
      """
      And request body
      When method post
      Then status 201
