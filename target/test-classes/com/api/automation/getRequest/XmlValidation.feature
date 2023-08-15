Feature: XML array validation

  Background: Set up the base path
    Given url 'http://localhost:9897'
    And print '==========Background=========='

  Scenario: Verifying the XML array
    When path '/normal/webapi/all'
    And header Accept = 'application/xml'
    And method get
    Then status 200
   	And match response/List/item/jobId == '1'
   	And match response/List/item/jobTitle == 'Software Engg'
   	And match response/List/item/experience/experience[2] == 'Apple'
   	And match response/List/item/project/project/projectName == 'Movie App'
   	And match response/List/item/project/project/technology/technology[3] == 'Gradle'
   	
   	#You can skip the response keyword
   	And match /List/item/project/project/technology/technology[2] == 'SQL Lite'
   	
   	#Travers the XML similar to JSON. XML index starts at 1.
   	And match response.List.item.experience.experience[1] == 'Apple'