Feature: How to use embedded expression

  Background: Create and initialize base URL
    Given url 'http://localhost:9897'
    When path '/normal/webapi/add'

  Scenario: Using embedded expression
    * def jobID = function() {return Math.floor((100) * Math.random());}
    #Using embedded expression in feature file
    And request {"jobId": '#(jobID())',"jobTitle": "QA","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: 'application/json', Content-Type : 'application/json' }
    When method post
    Then status 201
    And match response.jobTitle == 'QA'
    And print response
