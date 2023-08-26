Feature: How to do basic authantication

  Background: Initialize base url
    Given url 'http://localhost:9897'

  Scenario: Access the get endpoint with basic authantication
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json', Authorization: 'Basic YWRtaW46d2VsY29tZQ=='}
    When method get
    Then status 200
    And match response == '#notnull'

  Scenario: Access the get endpoint without basic authantication
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json'}
    When method get
    Then status 401
    And match response == '#notnull'

  Scenario: Access the get endpoint with bad credentials
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json', Authorization: 'Basic YW12541fnafY29tZQ'}
    When method get
    Then status 401
