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

  Scenario: Updating job entry for existing job in JSON format by calling the common method
    #Calling another feature file
    Given call read("../CreateJobEntry.feature")
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
      "jobId": 125,
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
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == 125)].project")
    And match projectArray[0] == '#[2]'

  Scenario: Updating job entry for existing job in JSON format by calling the common method with dynamic variable
    #Calling another feature file
    #Given call read("../CreateJobEntry.feature")
    #Calling another feature file and accessing variables
    * def postRequest = call read("../CreateJobEntry.feature")
    And print "Accessing the ID variable in another feature file==>", postRequest.id
    And print "Accessing the RV variable in another feature file==>", postRequest.getRandomValue()
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
      "jobId": '#(postRequest.id)',
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
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+postRequest.id+")].project")
    And match projectArray[0] == '#[2]'

  Scenario: Updating job entry for existing job in JSON format by calling the common method with multiple variables
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    * def postRequest = call read("../CreateJobEntryWithVariables.feature") {_url : 'http://localhost:9897', _path : '/normal/webapi/add', _id: '#(id)'}
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
