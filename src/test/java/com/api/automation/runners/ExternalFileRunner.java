package com.api.automation.runners;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class ExternalFileRunner {
	
	@Test
	public Karate runTest() {
		//return Karate.run("UsingExternalFile").relativeTo(getClass());
		return Karate.run("classpath:/com/api/automation/getRequest/UsingExternalFile.feature");
	}

}
