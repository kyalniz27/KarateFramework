Feature: How to do scenario outline

  Background: Setting up the data file
    * def testData = read('testData.csv')

  Scenario Outline: To create job description in the test application <method>
    Given print '<url>'
    When print '<path>'
    And print '<method>'
    Then print '<status>'

    Examples: 
      | url                   | path               | method | status |
      | http://localhost:9897 | /normal/webapi/all | get    |    200 |
      | http://localhost:9897 | /normal/webapi/add | post   |    201 |

  Scenario Outline: Data driven for the job description entry - <jobId>
    Given url 'http://localhost:9897'
    When path '/normal/webapi/add'
    And request {"jobId": '#(jobId)',"jobTitle": '#(jobTitle)',"jobDescription": '#(jobDescription)',"experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: 'application/json', Content-Type : 'application/json' }
    When method post
    Then status <status>

    Examples: 
      | jobId | jobTitle | jobDescription                | status |
      |  1234 | SDET     | To create automationframework |    201 |
      | id    | SDET     | To create automationframework |    400 |
      | false | SDET     | To create automationframework |    400 |

  Scenario Outline: Data driven for the job description entry using csv file - <jobId>
    Given url 'http://localhost:9897'
    When path '/normal/webapi/add'
    And request {"jobId": '#(jobId)',"jobTitle": '#(jobTitle)',"jobDescription": '#(jobDescription)',"experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: 'application/json', Content-Type : 'application/json' }
    When method post
    Then status <status>

    Examples: 
      | testData |
