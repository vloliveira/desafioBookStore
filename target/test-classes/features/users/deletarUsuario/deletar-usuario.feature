Feature:
  Background:


    * call read('classpath:features/gerarToken/auth.feature')

    * header Authorization = 'Bearer ' + token

    @smoke
    Scenario:
      Given url baseUrl
      And path '/Account/v1/User/', usuarioId
      When method delete
      Then status 204
