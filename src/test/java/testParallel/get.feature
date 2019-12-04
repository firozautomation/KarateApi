@ignore
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


  @SmokeTest
  @SanityTest
  Scenario: Get User information 1st.
    * url 'https://auth.fitchconnect-qa.com'
    * header Authorization = 'Bearer '  + token
    * header X-App-Client-Id = '99d151e0-7066-4268-b0dc-076d1ef72815'
    * header Content-Type = 'application/vnd.api+json'
    * header Content-Type = 'application/vnd.api+json'

    Given path '/v2/users/5ba3d4fae90c9f0001733862'
   # Given url 'https://api.fitchconnect-qa.com/v1/alert/settings'
    #And request alert
    When method get
    Then status 200
   # And match response.user.username == "shiftvision"

  @FunctionalTest
  Scenario:  Get User information 2nd.
    * url 'https://auth.fitchconnect-qa.com'
    * header Authorization = 'Bearer '  + token
    * header X-App-Client-Id = '99d151e0-7066-4268-b0dc-076d1ef72815'
    * header Content-Type = 'application/vnd.api+json'
    #* header Content-Type = 'application/vnd.api+json'

    Given path '/v1/alert/events?filter[5d07b2ebe1526900018ef433]'
   # Given url 'https://api.fitchconnect-qa.com/v1/alert/settings'
    #And request alert
    When method get
    Then status 200
   # And match response.user.username == "shiftvision"
