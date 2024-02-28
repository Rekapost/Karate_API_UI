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

# fetch the user-id  from the post call response
  * def UserId = jsonResponse.id 
  * print UserId
  
  #2. PUT call -- to update the user
* def requestPUT_PayLoad =
	"""
	  {
        "gender": "male",
        "status": "active"
    }
	""" 
	
  Given path '/public/v2/users/'+ UserId
	And request requestPUT_PayLoad
	And header Authorization = 'Bearer '+tokenID
	When method PUT
	Then status 200
	* print response
	* def jsonPut_Response = response
	* print jsonPut_Response
	* def put_name = jsonPut_Response.name
	* def put_id = jsonPut_Response.id
	* def put_email = jsonPut_Response.email
	* def put_status = jsonPut_Response.status
	* print name
	And match put_id == '#present'
	And match put_id == UserId
	And match put_name == '#present'
	And match put_name == 'NV10'
	And match put_status == 'active'
	And match put_status == requestPUT_PayLoad.status
  
