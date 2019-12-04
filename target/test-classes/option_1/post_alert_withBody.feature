Feature: alert Functionality


    Background:
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
    * header Authorization = 'Bearer '  + token
   # * header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJodHRwOi8vaWRlbnRpdHktZGF0YS1zZXJ2aWNlOjgwODAvdjIvdXNlcnMvNWJhM2Q0ZmFlOTBjOWYwMDAxNzMzODYyIiwic2NvcGUiOlsidHJ1c3QiXSwiYXRpIjoiNTlkMzY0ZGYtZGU3Ny00MmJiLWFhOWUtODI1MzE5Njc4YjVjIiwiaXNzIjoiaHR0cHM6Ly9sb2dpbi5maXRjaGNvbm5lY3QtcWEuY29tIiwiZXhwIjoxNTY0NDkzMzkzLCJpYXQiOjE1NTkzMDkzOTMsImF1dGhvcml0aWVzIjpbIlJPTEVfVVNFUiJdLCJqdGkiOiJlMGMxYTVjMi0wMjFhLTQzYjEtYjhkNy1iNzUwYTU1Y2Q3MmYiLCJjbGllbnRfaWQiOiJscXI3bzE0NWhmZ2FyNTNsa242b3FlOGRmYSJ9.6Lbh4sZYklXSkxTzeKgY4IlCTkgFtcXaM_DpSUvx6aE'
    * header X-App-Client-Id = '99d151e0-7066-4268-b0dc-076d1ef72815'
    * header Content-Type = 'application/vnd.api+json;charset=utf-8'
    * def alert =
"""
{
   "name" : "China Search Alert",
    "description" : "",
    "type" : "DATA",
    "targets" : [
        {
            "_id" : "",
            "type" : "QUERY_SCREENER_ENTITY",
            "query" : "{\"facets\":{\"ENTITY\":[{\"id\":\"80442243\",\"text\":\"China\",\"children\":[],\"showKeywordIcon\":false,\"isOperator\":false,\"type\":\"ENTITY\"}]},\"operators\":{\"ENTITY\":\"AND\"},\"requestBody\":{\"pageStart\":0,\"pageSize\":100,\"sortField\":\"entityName\",\"sortOrder\":\"asc\",\"slice\":{},\"entity\":{\"keywords\":[],\"marketSectorIds\":[],\"entityIds\":[\"80442243\"],\"geographies\":[],\"rated\":null},\"financial\":null,\"rating\":{\"ratingsDateFilter\":{\"startDate\":\"\",\"endDate\":\"\",\"latest\":true},\"ratings\":[{\"ratingType\":\"fitch-ratings\",\"ratingTypeID\":\"FC_LT_IDR\",\"ratingCodes\":null,\"ratingActions\":null,\"ratingAlerts\":null}]},\"operator\":{\"operators\":[{\"category\":\"entityIds\",\"operator\":\"AND\"}]},\"fir\":null},\"identifiers\":[]}",
            "ratableIds" : [ ] }],
    "triggers" : [
        {
            "type" : "NEWS",
            "values" : [
                "ALL_NEWS"
            ]}],
    "frequency" : {
        "type" : "INSTANT"
    }
}
"""

    Given path '/v1/alert/settings'
   # Given url 'https://api.fitchconnect-qa.com/v1/alert/settings'
    And request alert
    When method post
    Then status 201
