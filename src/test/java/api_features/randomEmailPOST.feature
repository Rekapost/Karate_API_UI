Feature: Create user using post api

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
	 # * requestPayload.email = randomString + "@gmail.com"
	  * set requestPayload.email = randomString + "@gmail.com"
	  
    * print requestPayload
	
Scenario: Create a user with given data 	
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
	And match name == '#present'
	#And match data.name == '#present'
	#And match $.data.name == 'NV3'
	And match name == 'NV10'
	And match email == requestPayload.email


