Feature: How to create resources in the application

Background: Create and initialize base URL
	Given url 'http://localhost:9897'
	When path '/normal/webapi/add'
	
	Scenario: Creating job entry in json format
	#Request body should be in single line
	And request {"jobId": 2,"jobTitle": "Software QA Engineer","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
	And headers {Accept: 'application/json', Content-Type : 'application/json' }
	When method post
	Then status 201
	And match response.jobTitle == 'Software QA Engineer'
	And print response
	
	Scenario: Reading data from external json file
	#Read data from external file
	* def body = read('data/jobEntry.json')
	And request body	
	And headers {Accept: 'application/json', Content-Type : 'application/json' }
	When method post
	Then status 201
	And match response.jobTitle == 'SDET'
	And print response

	
