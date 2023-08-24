Feature: How to delete job entry

  Background: Initialize base URL
    Given url 'http://localhost:9897'

  Scenario: How to delete specific job entry from the server
    #Create a new jon entry
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../CreateJobEntryWithVariables.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    #Delete request
    Given path '/normal/webapi/remove/' + createJobId
    And headers {Accept: 'application/json'}
    When method delete
    And status 200
    #get Request
    Given path '/normal/webapi/find'
    And params {id:'#(createJobId)',jobTitle:'Software Engg - 2'}
    And header Accept = 'application/json'
    When method get
    Then status 404

  Scenario: Request chaining
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../CreateJobEntryWithVariables.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    * def jobId = createJob.responseJobId
    * def jobTitle = createJob.responseJobTitle
    #Patch request
    * def jobDes = 'To develop android application and web application'
    Given path '/normal/webapi/update/details'
    And params {id:'#(jobId)',jobTitle:'#(jobTitle)',jobDescription:'#(jobDes)'}
    And header Accept = 'application/json'
    And request {}
    When method patch
    Then status 200
    * def jobId = response.jobId
    * def jobTitle = response.jobTitle
    #Get request
    Given path '/normal/webapi/find'
    And params {id:'#(jobId)',jobTitle:'#(jobTitle)'}
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.jobDescription == jobDes
