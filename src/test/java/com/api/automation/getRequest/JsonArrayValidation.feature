Feature: JSON array validation

  Background: Set up the base path
    Given url 'http://localhost:9897'
    And print '==========Background=========='

  Scenario: Verifying the JSON array
    When path '/normal/webapi/all'
    And header Accept = 'application/json'
    And method get
    Then status 200
    And match response[0].jobId == 1
    And match response[0].experience[1] == 'Apple'
    And match response[0].project[0].projectName == 'Movie App'
    And match response[0].project[0].technology[2] == 'Gradle'
    
		#Validating the size of JSON array
		And match response[0].experience == '#[3]'
		And match response[0].project[0].technology == '#[3]'
		
		#Using wild card char and verifying the json array
		And match response[0].experience[*] == ["Google","Apple","Mobile Iron"]
		And match response[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"]
		
		#Contains keyword with wild char
		And match response[0].project[0].technology[*] contains ['Kotlin']
		And match response[*].jobId contains 1