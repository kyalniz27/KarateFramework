Feature: How to get endpoint with query parameter

  Background: Initialize the base url
    Given url 'http://localhost:9897'

  Scenario: Get data using query paramater
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../../CreateJobEntryWithVariables.feature"){_url: 'http://localhost:9897', _path:'/normal/webapi/add', _id: '#(createJobId)'}
    #Send the Get request with query param
    Given path '/normal/webapi/find'
    #And param id = createJobId
    #And param jobTitle = 'Software Engg - 2'
    #Writing multiple params in a single statement
    And params {id : '#(createJobId)', jobTitle: 'Software Engg - 2'}
    And headers {Accept: 'application/json'}
    When method get
    Then status 200
    And match response.jobId == createJobId

  Scenario: Get data using query paramater with no present job id
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../../CreateJobEntryWithVariables.feature"){_url: 'http://localhost:9897', _path:'/normal/webapi/add', _id: '#(createJobId)'}
    #Send the Get request with query param
    Given path '/normal/webapi/find'
    And param id = 123456
    And param jobTitle = 'Software Engg - 2'
    And headers {Accept: 'application/json'}
    When method get
    Then status 404
