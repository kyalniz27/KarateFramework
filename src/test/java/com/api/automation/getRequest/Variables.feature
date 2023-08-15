# def keyword is used to create variables in Karate
# Syntax ==> <Gherkin keyword> <def> <variable_name> = <value> 
# You can also use * sign to omit the gherkin keyword
# Syntax ==> * <def> <variable_name> = <value> 

# Variables are good to use:
# 1. for repeating value
# 2. storing data from external file
# 3. Passing data from one feature file to another

#Note: The scope of variable is within the scenario
#Note: You can use variables in background like a global value

Feature: How to create variables

Background: Setting up global variables
	* def app_name = 'Google'
	* def page_load_timeout = 20
	
	
Scenario: Creating variables
	* def var_int = 10
	* def var_string = 'Karate'
	And print "Int Variable ==>", var_int
	And print "String Variable ==>", var_string
	And print 'Global variable app_name ==>', app_name
	And print 'Global variable timeout ==>', page_load_timeout
 
