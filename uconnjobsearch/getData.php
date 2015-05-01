<?php

 // Create report #1
$app->get('/seeker_summary', function () use($app) {
	$myQuery = "CALL getSeekerSummary()";
	echo queryTheDB($myQuery);    
});

//Create report #2
$app->get('/seeker_jobs/:seekerLName', function ($seekerLName) use($app) {
	$seekerLName = putInSingleQuotes($seekerLName);
	$myQuery = "CALL getSeekerJobs( ". $seekerLName ." )";
	echo queryTheDB($myQuery);    
});

//Create report #3
$app->get('/company_jobs/:companyName', function ($companyName) use($app) {
	$companyName = putInSingleQuotes($companyName);
	$myQuery = "CALL getCompanyJobs( ". $companyName ." )";
	echo queryTheDB($myQuery);    
});

//Create report #4
$app->get('/new_jobs/:startDate/:endDate', function ($startDate, $endDate) use($app) {
	$startDate = putInSingleQuotes($startDate);
	$endDate = putInSingleQuotes($endDate);
	$myQuery = "CALL getNewJobs( ". $startDate ." , " . $endDate ." )";
	echo queryTheDB($myQuery);    
});

//Create report #5
$app->get('/salary_and_title/:salary/:jobTitle', function ($salary, $jobTitle) use($app) {
	$jobTitle = putInSingleQuotes($jobTitle);
	$myQuery = "CALL getJobInfoFromTitleAndSalary( ". $jobTitle ." , " . $salary ." )";
	echo queryTheDB($myQuery);    
});

//Create report #6
$app->get('/seekers_for_jobid/:jobID', function ($jobID) use($app) {
	$jobID = putInSingleQuotes($jobID);
	$myQuery = "CALL getSeekersFromID( ". $jobID ." )";
	echo queryTheDB($myQuery);    
});

//Create report #7
$app->get('/seekers_from_university/:universityName', function ($universityName) use($app) {
	$universityName = putInSingleQuotes($universityName);
	$myQuery = "CALL getSeekersFromID( ". $universityName ." )";
	echo queryTheDB($myQuery);    
});

//Create report #8
$app->get('/payment_report/:startDate/:endDate', function ($startDate, $endDate) use($app) {
	$startDate = putInSingleQuotes($startDate);
	$endDate = putInSingleQuotes($endDate);
	$myQuery = "CALL getPaymentReportByDateRange( ". $startDate ." , " . $endDate ." )";
	echo queryTheDB($myQuery);    
});
//Get user education MUST BE LOGGED IN
$app->get('/user_education', function () use($app) {
	$userName = safelyGetUserName();
	$myQuery = "CALL getUserEducation( " . $userName . " )";
	echo queryTheDB($myQuery);    
});
//Get applications made by user, MUST BE LOGGED IN
$app->get('/getuserapplications', function () use($app) {
	//get userName from session
	$userName = safelyGetUserName();
	//Get all the jobs the user applied for
	$sql = "CALL getApplications( " . $userName . " )";
	$json = queryTheDB($sql);
	//decode json representation back to array
	$json = json_decode($json, true);
	//For each job
	$FinalJSON = array();
	$count = 0;
	foreach($json as $job)
	{
		//Grab jobID
		$jobID = $job["JobID"];
		//Check if job exists in user's matches on skills, edu, salary, exp
		$resultArray = checkCriteriaMatchesOnApplied($jobID, $userName);
		//Merge this array with $job
		$row = array_merge($job, $resultArray);
		$FinalJSON[$count] = $row;
		$count = $count + 1;
	}
	//Encode $json into json
	$json = $FinalJSON;
	$json = json_encode($json);
	echo $json;
});

$app->get('/getuserunappliedjobs', function () use($app) {
	//get userName from session
	$userName = safelyGetUserName();
	//Get all the jobs the user applied for
	$sql = "CALL getAllJobs( " . $userName . " )";
	$json = queryTheDB($sql);
	//decode json representation back to array
	$json = json_decode($json, true);
	//For each job
	$FinalJSON = array();
	$count = 0;
	foreach($json as $job)
	{
		//Grab jobID
		$jobID = $job["JobID"];
		//Check if job exists in user's matches on skills, edu, salary, exp
		$resultArray = checkCriteriaMatchesOnNotApplied($jobID, $userName);
		//Merge this array with $job
		$row = array_merge($job, $resultArray);
		$FinalJSON[$count] = $row;
		$count = $count + 1;
	}
	//Encode $json into json
	$json = $FinalJSON;
	$json = json_encode($json);
	echo $json;
}); 

//Get user education MUST BE LOGGED IN
$app->get('/user_job_history', function () use($app) {
	$userName = safelyGetUserName();
	$myQuery = "CALL getJobHistory( " . $userName . " )";
	echo queryTheDB($myQuery);    
});

//Get user skills, MUST BE LOGGED IN Fig 14
$app->get('/user_skills', function () use($app) {
	$userName = safelyGetUserName();
	$myQuery = "CALL getUserSkills( " . $userName . " )";
	echo queryTheDB($myQuery);  
});

//Get job details with count of total applicants to job
$app->get('/job_details/:jobID', function ($jobID) use($app) {
	$jobID = putInSingleQuotes($jobID);
	$myQuery = "CALL getJobDetails( ". $jobID ." )";
	echo queryTheDB($myQuery);    
});

//Get objective and salary
$app->get('/objective_salary', function () use($app) {
	//Check if current user has a resume in the DB
	$userName = safelyGetUserName();
	$sql = "SELECT ResumeID FROM Resume WHERE UName = ". $userName;
	$boolArray = array('false', 'true');
	$resumeExists = verifyResultsExist($sql);	
	//If resume doesn't exist create one
	if(!$resumeExists)
	{
		$sql = "INSERT INTO resume(UName) VALUES ( ". $userName .")";
		insertDeleteUpdateDB($sql, "insert");
	}
	//Get resumeID from userName
	$sql = "SELECT ResumeID FROM resume Where UName = " . $userName;
	$results = queryTheDB($sql);
	$results = json_decode($results, true);
	$resumeID = $results[0]["ResumeID"];
	$sql = "SELECT RObjective, RSalaryMin FROM Resume WHERE ResumeID = ". $resumeID;
	echo queryTheDB($sql);  
});

//Get a user's profile information
$app->get('/userprofileupdate', function () use($app) {
	$userName = safelyGetUserName();	
	$myQuery = "SELECT * FROM user WHERE UName = ". $userName;
	echo queryTheDB($myQuery);    
});

?>