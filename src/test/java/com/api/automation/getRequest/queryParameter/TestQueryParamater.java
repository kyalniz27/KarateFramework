package com.api.automation.getRequest.queryParameter;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestQueryParamater {
	
	@Test
	public Karate runTest() {
		//return Karate.run("getRequest","responseMatcher").relativeTo(getClass()); Note: Running multiple feature files
		return Karate.run("queryParamater").relativeTo(getClass());
	}
	
//Running testRunner using the class path (2nd way)	
//	@Test
//	public Karate runTestUsingClassPath() {
//		return Karate.run("classpath:/com/api/automation/getRequest/getRequest.feature");
//	}

}
