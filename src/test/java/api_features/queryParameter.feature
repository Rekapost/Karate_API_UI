Feature: Get API by Query parameter  feature

Scenario: get user details by query parameter
# Given url 'https://gorest.co.in/public/v2/users'
# Given url 'https://reqres.in/api/users'
# https://reqres.in/api/users?last_name=Bluth
# https://reqres.in/api/users?id=2
# https://reqres.in/api/users?first_name=Janet&last_name=Weaver
* def query = {first_name:'George', last_name:'Bluth', id:1}
#* def query = { first_name: 'George', last_name: 'Bluth' , id: 1}
Given url baseUrl +'/api/users' 
And params query 
When method GET
Then status 200
* print response
* def jsonResponse = response
* print jsonResponse
* def actName = jsonResponse.data.first_name
* def actId = jsonResponse.data.id
* print actName
* match actName == 'George'
* match actId == 1



Scenario: get user count details by query parameter
* def query = {first_name:'George'}
Given url baseUrl +'/api/users' 
And params query 
When method GET
Then status 200
* print response
* def jsonResponse = response
* print jsonResponse
* def data = jsonResponse.data
* def count = jsonResponse.data.length
* print count
* match count == 6
 
