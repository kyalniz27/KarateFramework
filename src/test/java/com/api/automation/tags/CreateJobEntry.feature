Feature: How to use job entry as a common method

  @Smoke
  Scenario: Updating job entry for existing job in JSON format
    Given url 'http://localhost:9897'
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    And request {"jobId": '#(id)',"jobTitle": "Software QA Engineer","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    When method post
    Then status 201
