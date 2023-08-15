package com.api.automation.postRequest.fileUpload;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class FileUploadRunner {
	
	@Test
	public Karate runTest() {
		return Karate.run("FileUpload").relativeTo(getClass());
	}
	

}
