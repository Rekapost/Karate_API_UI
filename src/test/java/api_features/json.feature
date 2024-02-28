Feature: json feature testing

Scenario: json reader parser

	* def jsonobject =
"""
[
{
	"name" : "Reka",
	"age"  : "bangalore",
	"city" :  45
},
{
	"name" : "Raja",
	"age"  : "pondy",
	"city" :  35
}
]
""" 

	* print jsonobject
	* print jsonobject[0]
	* print jsonobject[0].name
	* print jsonobject[1].age + "  "+jsonobject[1].city
	
Scenario: complex json reader

* def jsonobject =
"""
{"menu": 
{
  "id": "file",
  "value": "File",
  "popup": {
    "menuitem": [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
    ]
  }
}
}
"""
* print jsonobject
* print jsonobject.menu.id
* print jsonobject.menu.popup
* print jsonobject.menu.popup.menuitem
* print jsonobject.menu.popup.menuitem[0]
* print jsonobject.menu.popup.menuitem[0].value
* print jsonobject.menu.popup.menuitem[0].onclick

