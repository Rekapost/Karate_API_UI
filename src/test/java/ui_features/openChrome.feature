Feature:  karate ui automation
# to rerun failed scenario   if(info.errorMessage)  #rerun.feature 
  
  Background: 
    * configure afterScenario =
	    """
			    function(){
			    var info =karate.info;
			    karate.log(info);			    
			
			    if(info.errorMessage){
			    karate.call('openChrome.feature');                     
			    }
			  }   
	    """
  
	Scenario: sample ui automation 
	
	#	* configure driver = {type:'chromedriver'}
		* configure driver = {type:'chromedriver' , executable:'C:/Users/Reka/Drivers/chromedriver.exe'}
			Given driver 'https://www.amazon.in/'
			Then driver.maximize()
			* delay(5000)
			And waitFor('#abc')
