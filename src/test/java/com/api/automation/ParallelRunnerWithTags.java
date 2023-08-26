package com.api.automation;

import org.junit.jupiter.api.Test;
import com.intuit.karate.Runner.Builder;

public class ParallelRunnerWithTags {
	
	@Test
	public void ExecuteKarateTests() {
		Builder runner = new Builder();
		runner.path("classpath:com/api/automation");
		//Results results = runner.parallel(5);
		runner.parallel(5);
		runner.tags("@Smoke","@Regression");
		
	}

}
