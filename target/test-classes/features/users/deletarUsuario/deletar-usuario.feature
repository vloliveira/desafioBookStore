Feature:
  Background:

    * call read('classpath:features/gerarToken/auth.feature@sucesso')

  Scenario: Deletar usuário com token
    * header Authorization = 'Bearer ' + token
    Given url baseUrl
    And path '/Account/v1/User/', usuarioId
    When method delete
    Then status 204

  Scenario: Deletar usuário sem token
    Given url baseUrl
    And path '/Account/v1/User/', usuarioId
    When method delete
    Then status 401
    And match response == read('classpath:features/users/deletarUsuario/schema-deletar-erro.json')

