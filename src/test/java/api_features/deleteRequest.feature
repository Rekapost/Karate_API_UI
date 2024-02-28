Feature: Delete user using Delete api

Background:

	* url 'https://gorest.co.in'
	* def random_string = 
	"""
		function(s){
			var text = "";
			var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			for(var i=0; i<s; i++)
				text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
				return text;
		}
	"""
	* def randomString = random_string(10)
	* print randomString
	
	* def requestPayload = 
	"""
	  {
        "name": "NV10",
        "gender": "female",
        "status": "inactive"
    }
	"""
	  * set requestPayload.email = randomString + "@gmail.com"  
    * print requestPayload
	
Scenario: Delete a user with given user id 	
# 1  CREATE A USER USING POST CALL
	Given path '/public/v2/users'
	And request requestPayload
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

# FETCH USER ID from the response
* def UserId = jsonResponse.id
* print UserId

# delete SAME user with the givin UserId
	Given path '/public/v2/users/'+ UserId
	And header Authorization = 'Bearer '+tokenID
	When method DELETE
	Then status 204
	* print response
	
#  GET THE SAME USER  WITH USER ID TO CHECK IF AVAILABLE
	Given url baseUrl +'/public/v2/users/' + UserId
	When method GET
	Then status 404
	* print response
	* def jsonGetResponse = response
	* print jsonGetResponse
	* def message = jsonGetResponse.message
	And match message == 'Resource not found'
