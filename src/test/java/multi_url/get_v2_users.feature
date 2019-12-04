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

  Scenario: use 2nd url.
    * url 'http://kafka-rest.fitchsolutions-qa.com:8082'
    * header Authorization = 'Bearer '  + token
    * header X-App-Client-Id = '99d151e0-7066-4268-b0dc-076d1ef72815'
    * header Content-Type = 'application/vnd.kafka.avro.v2+json'
    * header Accept = 'application/vnd.kafka.v2+json, application/vnd.kafka+json, application/json'
    * def alerts = read('classpath:multi_url/paw.json')

    Given path '/topics/moodys'
   # Given url 'https://api.fitchconnect-qa.com/v1/alert/settings'
    And request alerts
    When method post
    Then status 200


  Scenario: use 3rd url.
    * url 'https://kubernetes.fitchconnect-qa.com/api/v1/proxy/namespaces/default/services/api-ews-data-service:8080'
    * header Authorization = 'Bearer '  + token
    * header X-App-Client-Id = '99d151e0-7066-4268-b0dc-076d1ef72815'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * def alerts = read('classpath:multi_url/mamun.json')

    Given path '/v1/ews/data'
# Given url 'https://api.fitchconnect-qa.com/v1/alert/settings'
# And request alert
    And request alerts
    When method post
    Then status 200
