package com.api.automation.secure.getRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class SecureGetRunner {
	
	@Test
	public Karate runTest() {
		return Karate.run("secureGetRequest").relativeTo(getClass());
		//return Karate.run("classpath:/com/api/automation/getRequest/UsingExternalFile.feature");
	}

}
