package com.api.automation.runners;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class VariablesRunner {
	
	@Test
	public Karate runTest() {
		//return Karate.run("getRequest","responseMatcher").relativeTo(getClass()); Note: Running multiple feature files
		//return Karate.run("Variables").relativeTo(getClass());
		return Karate.run("classpath:/com/api/automation/getRequest/Variables.feature");
	}

}
