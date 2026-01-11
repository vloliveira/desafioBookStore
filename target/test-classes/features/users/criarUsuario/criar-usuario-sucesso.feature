Feature: Criar usuário

  Background:
    Given url baseUrl

  Scenario:
      * def nome = Java.type('features.support.Utils').gerarNome()
      * print nome
      * def usuario =
      """
      {
      "userName": "#(nome)",
      "password": "Fulano464553#"
      }
      """
      Given path '/Account/v1/User'
      And request usuario
      When method post
      Then status 201

      * def usuarioId = response.userID
      * def nomeUsuario = usuario.userName
      * def senha = usuario.password
