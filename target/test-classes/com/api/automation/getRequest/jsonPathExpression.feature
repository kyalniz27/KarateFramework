Feature: How to do json path expression

Background: Setting up the base path
    Given url 'http://localhost:9897'
     And path '/normal/webapi/all'

  Scenario: Verify json path expression
  	When method get
  	And status 200
  	#Karate.jsonPath(doc,<jsonPathExpression>)
  	* def jobID = 1
  	* def jobTitle = karate.jsonPath(response,"$[?(@.jobId== "+jobID+")].jobTitle")
  	* def jobDesc = karate.jsonPath(response,"$[?(@.jobId==1)].jobDescription")
  	* def techie = karate.jsonPath(response, "$[?(@.jobId==1)]..technology")
  	And print "Job Title ==> ", jobTitle
  	And print "Job Description ==> ", jobDesc
  	And print "Technology ==> ", techie
   