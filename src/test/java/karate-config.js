	function fn() { 
		var env = karate.env; // get system property 'karate.env' karate.log('karate.env system property was:', env); 
		if (!env) { 
				env = 'dev'; 
				} 

		var config = { 
						env: env, 
						myVarName: 'hello karate', 
						baseUrl : 'https://gorest.co.in',
						tokenID: '86ecc2c3f7f7647f49f07b169414fc61ffdfd0f5385977c798e96de46d1fd5f6'
					}


	if (env == 'dev') { 
						// customize 
						// e.g. config.foo = 'bar'; 
						} else if (env == 'e2e') { 
						// customize 
					 } 
			return config; 
			}