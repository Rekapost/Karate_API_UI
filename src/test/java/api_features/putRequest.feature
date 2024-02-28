Feature: Update user using post api

Background:
	* url 'https://gorest.co.in'
#
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
#	
	* def requestPayload = 
	"""
	 {
        "status": "active",
        "email": "ra3@gmail.com",
   }
	"""
	
	 #* requestPayload.email = randomString + "@gmail.com"
	 #* set requestPayload.email = randomString + "@gmail.com"
	  
    * print requestPayload
	
Scenario: Update a user with PUT api	
	Given path '/public/v2/users/6579947'
	And request requestPayload
	And header Authorization = 'Bearer '+tokenID
	When method PUT
	Then status 200
	* print response
	* def jsonResponse = response
	* print jsonResponse
	* def name = jsonResponse.name
	* def id = jsonResponse.id
	* def email = jsonResponse.email
	* def status = jsonResponse.status
	* print name
	And match id == '#present'
	And match name == '#present'
	#And match data.name == '#present'
	#And match $.data.name == 'NV3'
	And match name == 'NV11'
	And match status == 'active'
	And match email == requestPayload.email
	And match email == 'ra3@gmail.com'
	And match status == requestPayload.status


