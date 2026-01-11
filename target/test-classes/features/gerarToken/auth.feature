Feature: Gerar token

  Background:
    * call read('classpath:features/users/criarUsuario/criar-usuario-sucesso.feature')
  @token
  Scenario:
    Given url baseUrl
    And path 'Account/v1/GenerateToken'
    And request
    """
    {
      "userName": "#(nomeUsuario)",
      "password": "#(senha)"
    }
    """
    When method post
    Then response.authorization != null

    * def token = response.token
    * print token