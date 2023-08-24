Feature: How to test patch endpoint for updating the job description

Background: Initialize base URL
	Given url 'http://localhost:9897'
	
	Scenario: Updating the job description for newly added job entry
		* def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../CreateJobEntryWithVariables.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    #Patch Request
    * def jobDes = 'To develop adroid app and web app'
    Given path '/normal/webapi/update/details'
    And params {id:'#(createJobId)',jobTitle:'Software Engg - 2', jobDescription:'#(jobDes)'}
		And header Accept = 'application/json'
		And request {}
		When method patch
		Then status 200
		And match response.jobDescription == jobDes 
		
			Scenario: Updating the job description for non-existing job entry
		* def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../CreateJobEntryWithVariables.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    #Patch Request
    * def jobDes = 'To develop adroid app and web app'
    Given path '/normal/webapi/update/details'
    And params {id:'-1',jobTitle:'Software Engg - 2', jobDescription:'#(jobDes)'}
		And header Accept = 'application/json'
		And request {}
		When method patch
		Then status 404
