Feature: Karate ui Automation

Scenario: Sample UI Automation Test
    Given driver 'https://www.google.com/'
	  And waitFor("input[type='search']" , 'karate ui automation')