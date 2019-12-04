Feature: alert Functionality


  Background:
 # Scenario: Login with valid user and valid password


    * url 'https://api.fitchconnect-qa.com'
    * header Content-Type = 'application/x-www-form-urlencoded'
   # * header Content-Type = 'application/json'
    And form field grant_type = "password"
    And form field password = "Connect1"
    And form field username = "miah.ashrafuzzaman@fitchsolutions.com"
    Given path '/v1/oauth/token'
    And request {}
    When method post
    Then status 200
    And def token = response.refresh_token
    * print 'Login token created: ' + token


  Scenario: create a alert and verify it.
   # * header Authorization = 'Bearer'  + token
    * header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJodHRwOi8vaWRlbnRpdHktZGF0YS1zZXJ2aWNlOjgwODAvdjIvdXNlcnMvNWJhM2Q0ZmFlOTBjOWYwMDAxNzMzODYyIiwic2NvcGUiOlsidHJ1c3QiXSwiYXRpIjoiNTlkMzY0ZGYtZGU3Ny00MmJiLWFhOWUtODI1MzE5Njc4YjVjIiwiaXNzIjoiaHR0cHM6Ly9sb2dpbi5maXRjaGNvbm5lY3QtcWEuY29tIiwiZXhwIjoxNTY0NDkzMzkzLCJpYXQiOjE1NTkzMDkzOTMsImF1dGhvcml0aWVzIjpbIlJPTEVfVVNFUiJdLCJqdGkiOiJlMGMxYTVjMi0wMjFhLTQzYjEtYjhkNy1iNzUwYTU1Y2Q3MmYiLCJjbGllbnRfaWQiOiJscXI3bzE0NWhmZ2FyNTNsa242b3FlOGRmYSJ9.6Lbh4sZYklXSkxTzeKgY4IlCTkgFtcXaM_DpSUvx6aE'
    * header X-App-Client-Id = '99d151e0-7066-4268-b0dc-076d1ef72815'
    * header Content-Type = 'application/vnd.api+json;charset=utf-8'
    #* def someJson = read('some-json.json')
    * def alerts = read('classpath:alert2/mamun.json')
    #* def alert = read('classpath:mamun.json')


    Given path '/v1/alert/settings'
       # Given url 'https://api.fitchconnect-qa.com/v1/alert/settings'
    And request alerts
    When method post
    Then status 201

