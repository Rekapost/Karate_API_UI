Feature: Create user using post api

Background: 
	* url 'https://gorest.co.in'
	* def requestPayLoad =
	"""
	  {
        "name": "NV10",
        "email": "NV10@gmail.com",
        "gender": "female",
        "status": "inactive"
    }
	"""
	Scenario: Create a user with given data 	
	Given path '/public/v2/users'
	And request requestPayLoad
	And header Authorization = 'Bearer '+tokenID
	When method POST
	Then status 201
	* print response
	* def jsonResponse = response
	* print jsonResponse
	* def name = jsonResponse.name
	* def id = jsonResponse.id
	* def email = jsonResponse.email
	* print name
	And match id == '#present'
	#And match data.name == '#present'
	#And match $.data.name == 'NV3'
	And match name == 'NV10'
	And match email == 'NV10@gmail.com'



