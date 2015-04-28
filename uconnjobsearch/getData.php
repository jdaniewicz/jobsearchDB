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


?>