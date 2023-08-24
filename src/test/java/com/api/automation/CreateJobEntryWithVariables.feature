Feature: How to use job entry as a common method

  Scenario: Updating job entry for existing job in JSON format
    Given url _url
    Given path _path
    And print "Helper variable ==>", _url
    And print "Helper variable ==>", _path
    And print "Helper variable ==>", _id
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    And request {"jobId": '#(_id)',"jobTitle": "Software QA Engineer","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    When method post
    Then status 201
    * def responseJobId = response.jobId
    * def responseJobTitle = response.jobTitle
