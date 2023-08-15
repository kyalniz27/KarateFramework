Feature: How to use external file

  Background: Set up the base path
    Given url 'http://localhost:9897'
    And def actualResponse = read("../data.json")

  Scenario: Using external JSON file in validation
    When path '/normal/webapi/all'
    And header Accept = 'application/json'
    And method get
    Then status 200
    #And match response == actualResponse
   	And print "JSON data file ==>", actualResponse