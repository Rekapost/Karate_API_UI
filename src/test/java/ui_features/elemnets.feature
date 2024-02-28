Feature:  karate ui automation- finding elements

Scenario: locators test
	
		* configure driver = {type:'chromedriver' , executable:'C:/Users/Reka/Drivers/chromedriver.exe'}
			Given driver 'https://www.amazon.in/'
			Then driver.maximize()
			* delay(1000)
			And driver.fullscreen()
			#And waitFor("{a}Computers") #tag and text
			#And waitFor("{}Computers")  #not bothered about about tag, text
			#And waitFor("{div/a}Computers") # parent, tag
			#And waitFor("{a:3}Computers")# 3rd element
			And waitFor("{^a}Today")# partial text
			#And waitFor("{^}Today")# partial text ,not bothered about about tag
			* dealy(1000)
			* leftOf("{^a}Today").find('{a}Best Sellers').click() # siblings left of Today
			#* rightOf("{^a}Today").find('{a}Electronics').click()# siblings right of Today
			* dealy(1000)