package com.api.automation.postRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class JSTestRunner {
	
	@Test
	public Karate runTest() {
		return Karate.run("JSTestExecuter").relativeTo(getClass());
	}
	

}
