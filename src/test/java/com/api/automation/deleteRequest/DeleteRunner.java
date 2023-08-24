package com.api.automation.deleteRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class DeleteRunner {
	@Test
	public Karate runTest() {
		return Karate.run("DeleteJobEntry").relativeTo(getClass());
	}
}
