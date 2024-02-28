Feature: Get API headers feature

Scenario: pass the user request with headers_Part1
Given header Content-Type = 'text/xml;charset=ISO-8859-1'
And header Accept-Encoding = 'gzip,deflate,br'
And header Connection = 'Keep-Alive'
#And header Expect = '100-continue'
And header User-Agent = 'PostmanRuntime/7.36.3'
#And header User-Agent = 'Mozilla/4.0(compatible;IE;GACv7\. 1\. 5192\. 22378)'
#And header Authorization = 'Bearer 007526d9efdbc07e084ff7a6d4cfcc90588fbe20641c00faebf45a7f3b2eaf33'

When url baseUrl +'/api/users'
And path '2'
When method GET
Then status 200
* print response

Scenario: pass the user request with headers_Part2
* def requestHeaders = {Content-Type:'text/xml;charset=ISO-8859-1',Accept-Encoding:'gzip,deflate,br',Connection:'Keep-Alive',User-Agent:'PostmanRuntime/7.36.3'}
Given request requestHeaders
When url baseUrl +'/api/users'
And path '2'
When method GET
Then status 200
* print response

Scenario: pass the user request with headers_Part3
* configure headers = {Content-Type:'text/xml;charset=ISO-8859-1',Accept-Encoding:'gzip,deflate,br',Connection:'Keep-Alive',User-Agent:'PostmanRuntime/7.36.3'}
When url baseUrl +'/api/users'
And path '2'
When method GET
Then status 200
* print response