Feature: Validating the get endpoint with response keyword

  Background: Set up the base path
    Given url 'http://localhost:9897'
    And print '==========Background=========='

  Scenario: To get data in json format with response
    When path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response

  Scenario: To get data in xml format with response
    When path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response