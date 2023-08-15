Feature: Testing the get endpoint of the application

  Background: Set up the base path
    Given url 'http://localhost:9897'
    And print '==========Background=========='

  Scenario: Get all the data from the application in json
    When path '/normal/webapi/all'
    And header Accept = 'application/json'
    And method get
    Then status 200
    And match response ==
      """
      [
      {
          "jobId": 1,
          "jobTitle": "Software Engg",
          "jobDescription": "To develop andriod application",
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
              }
          ]
      }
      ]
      """

  Scenario: Get all the data from the application in xml format
    When path '/normal/webapi/all'
    And header Accept = 'application/xml'
    And method get
    Then status 200
    And match response ==
      """
      <List>
      <item>
         <jobId>1</jobId>
         <jobTitle>Software Engg</jobTitle>
         <jobDescription>To develop andriod application</jobDescription>
         <experience>
             <experience>Google</experience>
             <experience>Apple</experience>
             <experience>Mobile Iron</experience>
         </experience>
         <project>
             <project>
                 <projectName>Movie App</projectName>
                 <technology>
                     <technology>Kotlin</technology>
                     <technology>SQL Lite</technology>
                     <technology>Gradle</technology>
                 </technology>
             </project>
         </project>
      </item>
      </List>
      """

  Scenario: Get data from the application in json using negate condition
    When path '/normal/webapi/all'
    And header Accept = 'application/json'
    And method get
    Then status 200
    And match response !=
      """
      [
      {
          "jobId": 11,
          "jobTitle": "Software Engg",
          "jobDescription": "To develop andriod application",
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
              }
          ]
      }
      ]
      """

  Scenario: Get data in json format and validate specific property
    When path '/normal/webapi/all'
    And header Accept = 'application/json'
    And method get
    Then status 200
    And match response contains deep {"jobDescription": "To develop andriod application"}
	  And match response contains deep {"project":[{"projectName": "Movie App"}]}
		And match header Connection == 'keep-alive'
		And match header Content-Type == 'application/json'
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    