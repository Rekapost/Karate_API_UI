Feature: Get API by giving API Token feature

Scenario: get user details
* print tokenID
Given header Authorization = 'Bearer '+tokenID
Given url baseUrl + '/public/v1/users'
And path '6521773'
When method GET
Then status 200
* print response

# Did not work , but code correct