Feature: How to file upload in Karate framework

Background: Setting up the base path
    Given url 'http://localhost:9897'
     And path '/normal/webapi/upload'

  Scenario: Verify upload file in the same directory
  	#1. Location the file, 2. Name of the file, 3. Content-type header
  	And multipart file file = {read: 'TestFile.txt',filename: 'TestFile.txt', Content-type: 'multipart/form-data'}
  	When method post
  	And status 200
  	And print response
  	
  	Scenario: Verify upload file in different directroy
  	#1. Location the file, 2. Name of the file, 3. Content-type header
  	* def fileLocation = '../data/jobEntry.json'
  	And multipart file file = {read: '#(fileLocation)',filename: 'jobEntry.json', Content-type: 'multipart/form-data'}
  	When method post
  	And status 200
  	And print response
  	And match response.message contains 'jobEntry.json'