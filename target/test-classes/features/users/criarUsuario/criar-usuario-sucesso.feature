Feature: Criar usuário

  Background:
    Given url baseUrl

  @sucesso
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

  Scenario: Criar usuario já cadastrado

    Given url baseUrl + '/Account/v1/User'
    * def usuario =
     """
      {
      "userName": "#(usuarioId)",
      "password": "#(senha)"
      }
      """
    And request usuario
    When method post
    Then status 400


