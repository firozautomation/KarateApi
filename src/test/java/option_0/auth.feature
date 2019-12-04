Feature: get auth

  Scenario: get auth
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