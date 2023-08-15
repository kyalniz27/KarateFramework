Feature: How to run JS functions

Scenario: Implementing and running js functions
	* def intValue = function() {return 10;}
	And print "This is the value of intValue function ==> ", intValue()
	* def randomNumber = function() {return Math.floor((1000) * Math.random());}
	And print "This is the value of random number function ==> ", randomNumber()
	* def sumValue = function(num1,num2) {return (num1+num2);}
	And print "Sum of two values ==>", sumValue(10,15)