Feature: How to validate schema

  Background: Setting up the base path
    Given url 'http://localhost:9897'

  Scenario: Verify json schema validation
    And path '/normal/webapi/add'
    * def body = read('data/jobEntry.json')
    And request body
    And headers {Accept: 'application/json', Content-Type : 'application/json' }
    And method post
    Then status 201
    And match response ==
      """
      {
       "jobId" : '#number',
       "jobTitle" : '#string',
       "jobDescription" : '#string',
       "experience" : '#[] #string',
       "project" : '#[] #object'
      
      }
      """

  Scenario: Verifying complex json schema validation
    And path '/normal/webapi/all'
    And headers {Accept: 'application/json', Content-Type : 'application/json' }
    And method get
    Then status 200
    * def projectSchema = {"projectName" : '#string', "technology" : '#[] #string'}
    * def mainSchema = {"jobId" : '#number', "jobTitle" : '#string', "jobDescription": "#string", "experience": '#[] #string', "project" : '#[] ##(projectSchema)'}
    And match response ==
      """
      '#[] ##(mainSchema)'
      """
