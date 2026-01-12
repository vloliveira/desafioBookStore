Feature: Gerar token

  Background:
    * call read('classpath:features/users/criarUsuario/criar-usuario.feature@sucesso')

  @sucesso
  @token
  Scenario: Gerar token válido
    Given url baseUrl
    And path '/Account/v1/GenerateToken'
    And request
    """
    {
      "userName": "#(nomeUsuario)",
      "password": "#(senha)"
    }
    """
    When method post
    Then match response.token != null
    And  status 200

    * def token = response.token
    * print token

  @negative
  Scenario: Gerar token com senha incorreta
    Given url baseUrl
    And path '/Account/v1/GenerateToken'
    And request
    """
    {
      "userName": "#(nomeUsuario)",
      "password": "senhaIncorreta132@"
    }
    """
    When method post
    Then match response.token == null
    And  status 200
    # A API da BookStore informa que o status code para este cenário é 200