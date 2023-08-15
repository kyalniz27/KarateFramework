Feature: How to test update endpoint in the application

  Background: Initialize base url
    Given url 'http://localhost:9897'

  Scenario: Updating job entry for existing job in JSON format
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    And request {"jobId": '#(id)',"jobTitle": "Software QA Engineer","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    When method post
    Then status 201
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
      "jobId": '#(id)',
      "jobTitle": "Software Engg - 3",
      "jobDescription": "To develop andriod application and web application",
      "experience": [
        "Google",
        "Apple",
        "Mobile Iron"
      ],
      "project": [
        {
          "projectName": "Movie App",
          "technology": [
            "Kotlin",
            "SQL Lite",
            "Gradle"
          ]
        },
         {
          "projectName": "Music App",
          "technology": [
            "Google",
            "Apple",
            "Signify"
          ]
        }
      ]
      }
      """
    And headers {Accept: 'application/json', Content-Type : 'application/json' }
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+id+")].project")
    And match projectArray[0] == '#[2]'
    
     Scenario: Updating job entry for non-existing job in JSON format
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    And request {"jobId": '#(id)',"jobTitle": "Software QA Engineer","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    When method post
    Then status 201
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
      "jobId": '#(getRandomValue())',
      "jobTitle": "Software Engg - 3",
      "jobDescription": "To develop andriod application and web application",
      "experience": [
        "Google",
        "Apple",
        "Mobile Iron"
      ],
      "project": [
        {
          "projectName": "Movie App",
          "technology": [
            "Kotlin",
            "SQL Lite",
            "Gradle"
          ]
        },
         {
          "projectName": "Music App",
          "technology": [
            "Google",
            "Apple",
            "Signify"
          ]
        }
      ]
      }
      """
    And headers {Accept: 'application/json', Content-Type : 'application/json' }
    When method put
    Then status 404
