Feature: JSON array validation

  Background: Set up the base path
    Given url 'http://localhost:9897'
    And print '==========Background=========='

  Scenario: Verifying the JSON data using fuzzy matcher
    When path '/normal/webapi/all'
    And header Accept = 'application/json'
    And method get
    Then status 200
    And match response[0].jobId == '#present'
    And match response[0].experience[1] == '#notnull'
    And match response[0].project[0].projectName == '#ignore'
    And match response[0].project[0].technology == '#array'
    And match response[0].jobTitle == '#string'
    And match response[0].jobId == '#number'

  Scenario: Verifying the XML data using fuzzy matcher
    When path '/normal/webapi/all'
    And header Accept = 'application/xml'
    And method get
    Then status 200
    And match response/List/item/jobId == '#notnull'
    And match response/List/item/jobTitle == '#string'
    And match response/List/item/experience/experience[2] == '#notnull'
    And match response/List/item/project/project/projectName == '#present'
    And match response/List/item/project/project/technology/technology[3] == '#ignore'

  Scenario: Verify JSON data using complex fuzzy matching
    When path '/normal/webapi/all'
    And header Accept = 'application/json'
    And method get
    Then status 200
    #'_' represents the value of response[0].jobId and after that you can any JS expression.
    #return true if (_ == 1) is correct
    And match response[0].jobId == '#? _ == 1'
    And match response[0].jobTitle == '#string? _.length == 13'
    #Verify array of strings
    And match response[0].experience == '#[3] #string'
    #Verify array of strings and its size greater than
    And match response[0].experience == '#[3] #string? _.length >= 2'
