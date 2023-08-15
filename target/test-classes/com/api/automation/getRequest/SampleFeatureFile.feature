Feature: Testing the get endpoint of the application

  Scenario: Get endpoint of the application with json
    Given the application url 'www.google.com'
    And the context path is '/getdata'
    When I send the get request
    Then the status code should be 200
    And the response format should be in JSON

  Scenario: Get endpoint of the application with xml
    Given the application url 'www.google.com'
    And the context path is '/getdata'
    When I send the get request
    Then the status code should be 200
    And the response format should be in XML
