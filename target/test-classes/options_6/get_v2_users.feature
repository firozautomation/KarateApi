Feature: alert Functionality


   Background:
 # Scenario: Login with valid user and valid password


    * url 'https://api.fitchconnect-qa.com'
    * header Content-Type = 'application/x-www-form-urlencoded'
   # * header Content-Type = 'application/json'
    And form field grant_type = "password"
    And form field password = "Connect1"
    And form field username = "paulette.warrick@fitchsolutions.com"
    Given path '/v1/oauth/token'
    And request {}
    When method post
    Then status 200
    And def token = response.refresh_token
    * print 'Login token created: ' + token


  @ignore
  @Scenario2
  Scenario: create a alert and verify it.
    * url 'https://auth.fitchconnect-qa.com'
    * header Authorization = 'Bearer '  + token
    * header X-App-Client-Id = '99d151e0-7066-4268-b0dc-076d1ef72815'
    * header Content-Type = 'application/vnd.api+json'
    * header Content-Type = 'application/vnd.api+json'


    Given path '/v2/users/5ba3d4fae90c9f0001733862'
   # Given url 'https://api.fitchconnect-qa.com/v1/alert/settings'
   # And request alert
    When method get
    Then status 200
    And match response.data.id == "5ba3d4fae90c9f0001733862"
    And match response.data.attributes.firstName == "Ashrafuzzaman"
    And match response.data.attributes.lastName == "Miah"
    And match response.data.attributes.customData.secondaryPhoneNumber == "6465823544"

  @regression
  Scenario: create a alert and verify it.
    * url 'https://auth.fitchconnect-qa.com'
    * header Authorization = 'Bearer '  + token
    * header X-App-Client-Id = '99d151e0-7066-4268-b0dc-076d1ef72815'
    * header Content-Type = 'application/vnd.api+json'
    * header Content-Type = 'application/vnd.api+json'


    Given path '/v2/users/5ac7834c0227ab000195f8c2'
   # Given url 'https://api.fitchconnect-qa.com/v1/alert/settings'
   # And request alert
    When method get
    Then status 200
    And match response.data.id == "5ac7834c0227ab000195f8c2"
    And match response.data.attributes.firstName == "Paulette"
    And match response.data.attributes.lastName == "W"

