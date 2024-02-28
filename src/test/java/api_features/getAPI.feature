
Feature: Get API feature

Scenario: get user details
#Given url 'https://gorest.co.in/public/v2/users'
Given url 'https://reqres.in/api/users'
#Given url baseUrl +'/api/users'
And path '2'
When method GET
Then status 200
* print response
* def jsonResponse = response
* print jsonResponse
* def actName = jsonResponse.data.first_name
* def actId = jsonResponse.data.id
* print actName
* match actName == 'Janet'
* match actId == 2


Scenario: get user details - user not found Negative testing
Given url 'https://reqres.in/api/users'
And path '900'
When method GET
Then status 404