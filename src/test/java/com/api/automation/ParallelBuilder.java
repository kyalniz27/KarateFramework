package com.api.automation;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

public class ParallelBuilder {
	
	@Test
	public void ExecuteKarateTests() {
		Builder runner = new Builder();
		runner.path("classpath:com/api/automation");
		Results results = runner.parallel(5);
		System.out.println("Total feature ==> " + results.getFeaturesTotal());
		System.out.println("Total scenarios ==> " + results.getScenariosTotal());
		System.out.println("Total passed ==> " + results.getScenariosPassed());
		System.out.println("Total failed ==> " + results.getScenariosFailed());
		
		Assertions.assertEquals(0, results.getFailCount(), "There are some failed scenarios.");
	}

}
