<?php

/****VERIFYING LOGIN CREDENTIALS *****/
$app->post('/login', function() use ($app)
{
    //Grab the json in the request
	$request = $app->request();
	$body = $request->getBody();
	$json = json_decode($body, true);
	//Parse the json for the values 
	$userName = $json["UName"];
	$password = $json["UPasswd"];
	//Sanitize and see if credentials check out
	$userName = putInSingleQuotes($userName);
	$password = putInSingleQuotes($password);
	$isValid = verifyUserCredentials($userName, $password);
	
	//The response indicating whether login was successful or not
	$responseJSON = NULL;
	
	if($isValid == TRUE)
	{
		//Create session server side and give client cookie with pointer to session
		session_start();
		$_SESSION["userName"] = $userName;
		$responseJSON = array('status' => "success");
	}
	else 
	{
		$responseJSON = array('status' => "failure");
	}
	//Encode array as JSON and send back to client
	echo json_encode($responseJSON);
});

/****CREATING A NEW USER *****/
$app->post('/newuser', function() use($app)
{
	//Grab the json in the request
	$request = $app->request();
	$body = $request->getBody();
	$json = json_decode($body, true);
	//Parse the json for the values 
	$userName = $json["username"];
	$password = $json["password"];
	//$confirmPassword = $json["confirmpassword"];
	$firstname = $json["firstname"];
	$lastname = $json["lastname"];
	$address1 = $json["address1"];
	$address2 = $json["address2"];
	$city = $json["city"];
	$state = $json["state"];
	$zip = $json["zip"];
	$email = $json["email"];
	$phone = $json["phone"]; 
	$fax = $json["fax"];
	$cell = $json["cell"];
	$web = $json["web"];
	
	//Sanitize inputs
	$userName = putInSingleQuotes($userName);
	$password = putInSingleQuotes($password);
	$firstname = putInSingleQuotes($firstname);
	$lastname = putInSingleQuotes($lastname);
	$address1 = putInSingleQuotes($address1);
	$address2 = putInSingleQuotes($address2);
	$city = putInSingleQuotes($city);
	//$state = putInSingleQuotes($state);
	$zip = putInSingleQuotes($zip);
	$email = putInSingleQuotes($email);
	$phone = putInSingleQuotes($phone);
	$fax = putInSingleQuotes($fax);
	$cell = putInSingleQuotes($cell);
	$web = putInSingleQuotes($web);
	
	//Result flags
	$uniqueUserName = !verifyResultsExist("CALL checkIfUserNameExists( ".$userName. " )");
	$uniqueEmail = !verifyResultsExist("CALL checkIfEmailExists( ".$email. " )");
	
	
	if($uniqueUserName && $uniqueEmail)
	{
		$sql = "CALL insertUserEntry( ". $userName ." , ". $password ." , ". $firstname ." , ";
		$sql .= $lastname ." , ".$address1 ." , ".$address2 ." , ".$city ." , ";
		$sql .= $state ." , ".$zip ." , ".$email ." , ".$phone ." , ".$fax ." , ";
		$sql .= $cell ." , ".$web ." )";
		$isSuccess = insertDeleteUpdateDB($sql, "insert");
	}
	$parameter = 0;
	//echo replaceWithNull($parameter);
	echo json_encode(array("isUserNameUnique" => $uniqueUserName, "isEmailUnique" => $uniqueEmail ));
});

/**** RETRIEVING AND HOLDING OBJECTIVE AND SALARY *****/
$app->post('/resumeupdate', function() use($app)
{
	//Grab the json in the request
	$request = $app->request();
	$body = $request->getBody();
	$json = json_decode($body, true);
	//Parse the json for the values 
	$objective = putInSingleQuotes($json["objective"]);
	$salary = $json["salary"];
	
	//Save these values in session
	//session_start();
	//$_SESSION["objective"] = $objective;
	//$_SESSION["salary"] = $salary;
	
	//Check if current user has a resume in the DB
	$userName = safelyGetUserName();
	//$userName = $_SESSION["userName"];
	$sql = "SELECT ResumeID FROM Resume WHERE UName = ". $userName;
	$boolArray = array('false', 'true');
	$resumeExists = verifyResultsExist($sql);
	//echo $_SESSION["objective"];
	
	//If resume doesn't exist create one
	if(!$resumeExists)
	{
		$sql = "INSERT INTO resume(UName) VALUES ( ". $userName .")";
		insertDeleteUpdateDB($sql, "insert");
		//echo "RECORD CREATED!";
	}
	//Get resumeID from userName
	$sql = "SELECT ResumeID FROM resume Where UName = " . $userName;
	$results = queryTheDB($sql);
	$results = json_decode($results, true);
	$resumeID = $results[0]["ResumeID"];
	//Update objective and salary in DB
	$sql = "CALL updateObjAndSal( ". $resumeID ." , ". $objective . " , " . $salary . " )";
	insertDeleteUpdateDB($sql, "update");
	//updateObjAndSal`(IN id INT, obj VARCHAR(500), sal INT)
});
/********* CREATING NEW EDUCATION ENTRY ********************************/
$app->post('/educationentryscreen', function() use($app)
{
	//Grab json from request
	$request = $app->request();
	$body = $request->getBody();
	//echo var_dump($body);
	$json = json_decode($body, true);
	//echo $json;
	//Parse the json
	$school = $json["school"];
	$degree = $json["degree"];
	$degreeArea = $json["degreeArea"];
	$gpa = $json["gpa"];
	$startDate = putInSingleQuotes($json["startDate"]);
	$gradDate = putInSingleQuotes($json["gradDate"]);
	//Get resumeID from userName
	$userName = safelyGetUserName();
	$sql = "SELECT ResumeID FROM resume Where UName = " . $userName;
	$results = queryTheDB($sql);
	$results = json_decode($results, true);
	$resumeID = $results[0]["ResumeID"];
	
	//Insert into DB
	$sql = "CALL addEduEntry( ". $school . " , ". $degree . " , ". $degreeArea;
	$sql .= " , ". $gpa . " , ". $startDate . " , ". $gradDate . " , " .$resumeID ." ) ";
	insertDeleteUpdateDB($sql, "insert"); 
	 
});

/**************** APPLY CURRENT USER TO JOB ******************************/
$app->post('/applytojobs', function () use($app) {
	//Get username from current session cookies
	$userName = safelyGetUserName();
	//Grab json from request
	$request = $app->request();
	$body = $request->getBody();
	$json = json_decode($body, true);
	foreach($json as $job)
	{
		$jobID = $job["jobID"];
		$sql = "INSERT INTO applies(JobID, UName, ApplicationID, DateApplied)
			VALUES ( ".$jobID." , " . $userName ." , 47, CURDATE())
            ON DUPLICATE KEY UPDATE ApplicationID=VALUES(ApplicationID),DateApplied=VALUES(DateApplied)";
		insertDeleteUpdateDB($sql, "insert");
	}
	  
});
/**************** Delete current user's application(s) ******************************/
$app->post('/deleteapplication', function () use($app) {
	//Get username from current session cookies
	$userName = safelyGetUserName();
	//Grab json from request
	$request = $app->request();
	$body = $request->getBody();
	$json = json_decode($body, true);
	foreach($json as $application)
	{
		$jobID = $application["jobID"];
		$sql = "CALL deleteApplication( ". $jobID ." , " . $userName . " )";
		insertDeleteUpdateDB($sql, "delete");
	}
	echo "success!";
});
/***************** POST criteria to retrieve  unapplied jobs for user *******/
$app->post('/filterunappliedjobs', function () use($app) {
	//Get username from current session cookies
	$userName = safelyGetUserName();
	//Grab json from request
	$request = $app->request();
	$body = $request->getBody();
	$json = json_decode($body, true);
	//Parse json for values 
	$jobTitle = putInSingleQuotes($json["jobTitle"]);
	$company = putInSingleQuotes($json["company"]);
	$salary = replaceWithNull($json["salary"]);
	$location = replaceWithNull($json["location"]);
	//Get jobs via filters
	$sql = "CALL searchJobsNotApplied( ". $userName ." , " . $jobTitle . " , "
		 . $company . " , " . $salary . " , ". $location . " )";
	$json = queryTheDB($sql);
	//Decode json of results again
	$json = json_decode($json, true);
	//Iterate through each job
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
/************** Delete Education Entries for user **************************/
$app->post('/deleteeducationrecord', function () use($app) {
	//Get username from current session cookies
	$userName = safelyGetUserName();
	//Grab json from request
	$request = $app->request();
	$body = $request->getBody();
	$json = json_decode($body, true);
	foreach($json as $application)
	{
		$eduID = $application["educationID"];
		$sql = "CALL deleteEduEntry( " . $eduID . " )";
		insertDeleteUpdateDB($sql, "delete");
	}
	echo "success!";
});

/************** Delete Experience Entries for user **************************/
$app->post('/deletepriorjob', function () use($app) {
	//Get username from current session cookies
	$userName = safelyGetUserName();
	//Grab json from request
	$request = $app->request();
	$body = $request->getBody();
	$json = json_decode($body, true);
	foreach($json as $application)
	{
		$jobID = $application["priorJobID"];
		$sql = "CALL deleteJobHistoryEntry( " . $jobID . " )";
		insertDeleteUpdateDB($sql, "delete");
	}
	echo "success!";
});

/********* CREATING NEW EXPERIENCE ENTRY ********************************/
$app->post('/experienceentry', function() use($app)
{
	//Grab json from request
	$request = $app->request();
	$body = $request->getBody();
	$json = json_decode($body, true);
	//echo $json;
	//Parse the json
	$company = putInSingleQuotes($json["company"]);
	$jobTitle = putInSingleQuotes($json["jobTitle"]);
	$location = putInSingleQuotes($json["location"]);
	$state = $json["state"];
	$duties = putInSingleQuotes($json["duties"]);
	$startDate = putInSingleQuotes($json["startDate"]);
	$endDate = putInSingleQuotes($json["endDate"]);
	//Get resumeID from userName
	$userName = safelyGetUserName();
	$sql = "SELECT ResumeID FROM resume Where UName = " . $userName;
	$results = queryTheDB($sql);
	$results = json_decode($results, true);
	$resumeID = $results[0]["ResumeID"];
	
	//Insert into DB
	$sql = "CALL addJobHistoryEntry( ". $company . " , ". $jobTitle . " , ". $location." , ". $state;
	$sql .= " , ". $duties . " , ". $startDate . " , ". $endDate . " , " .$resumeID ." ) ";
	//echo $sql;
	insertDeleteUpdateDB($sql, "insert"); 
	 
});

/**************** ADD Skill to current user ******************************/
$app->post('/user_skills', function () use($app) {
	//Get username from current session cookies
	$userName = safelyGetUserName();
	//Grab json from request
	$request = $app->request();
	$body = $request->getBody();
	$json = json_decode($body, true);
	//Get resumeID from userName
	$sql = "SELECT ResumeID FROM resume Where UName = " . $userName;
	$results = queryTheDB($sql);
	$results = json_decode($results, true);
	$resumeID = $results[0]["ResumeID"];
	//Connect to DB to delete old skillset
	$conn = connectToDB();
    // Check connection
    if ($conn->connect_error)
	{
    	die("Connection failed: " . $conn->connect_error);
    }
	else
	{
		//First clear old skillset
		$sql = "CALL deleteResumeSkillset(". $resumeID.")";
	    $conn->query($sql);
		//Dont forget to reset safety on DB IMPORTANT!!!!!
		$sql = "SET SQL_SAFE_UPDATES=1";
		$conn->query($sql);
		$conn->close();
    }
	//Now update skillset
	foreach($json as $job)
	{
		$skillID = $job["SSkillID"];
		$sql = "INSERT INTO skillset(SSkillID, ResumeID)
			VALUES ( ".$skillID." , " . $resumeID .")
            ON DUPLICATE KEY UPDATE SSKillID=VALUES(SSkillID),ResumeID=VALUES(ResumeID)";
		insertDeleteUpdateDB($sql, "insert");
	}
	echo "success!";  
});

//Update a user's profile information
$app->post('/userprofileupdate', function () use($app) {
	$userName = safelyGetUserName();
	//Grab the json in the request
	$request = $app->request();
	$body = $request->getBody();
	$json = json_decode($body, true);
	//Parse the json for the values 
	$password = $json["password"];
	$firstname = $json["firstname"];
	$lastname = $json["lastname"];
	$address1 = $json["address1"];
	$address2 = $json["address2"];
	$city = $json["city"];
	$state = $json["state"];
	$zip = $json["zip"];
	$email = $json["email"];
	$phone = $json["phone"]; 
	$fax = $json["fax"];
	$cell = $json["cell"];
	$web = $json["web"];
	
	//Sanitize inputs
	$password = putInSingleQuotes($password);
	$firstname = putInSingleQuotes($firstname);
	$lastname = putInSingleQuotes($lastname);
	$address1 = putInSingleQuotes($address1);
	$address2 = putInSingleQuotes($address2);
	$city = putInSingleQuotes($city);
	$zip = putInSingleQuotes($zip);
	$email = putInSingleQuotes($email);
	$phone = putInSingleQuotes($phone);
	$fax = putInSingleQuotes($fax);
	$cell = putInSingleQuotes($cell);
	$web = putInSingleQuotes($web);
	
	//See if user is going to keep their old email
	$myQuery = "SELECT UEmail FROM user WHERE UName = ". $userName;
	$oldEmailData =  queryTheDB($myQuery);
	$oldEmailData = json_decode($oldEmailData,true);
	$oldEmail = putInSingleQuotes($oldEmailData[0]["UEmail"]);
	
	//Result flag, initially FALSE;
	$uniqueEmail = FALSE;
	if ($oldEmail === $email)
	{
		$uniqueEmail = TRUE;
	}
	else
	{
	//Check if this new email already exists
	$uniqueEmail = !verifyResultsExist("CALL checkIfEmailExists( ".$email. " )");
	}
	
	
	
	if($uniqueEmail)
	{
		$sql = "CALL updateUser( ". $userName ." , ". $password ." , ". $firstname ." , ";
		$sql .= $lastname ." , ".$address1 ." , ".$address2 ." , ".$city ." , ";
		$sql .= $state ." , ".$zip ." , ".$email ." , ".$phone ." , ".$fax ." , ";
		$sql .= $cell ." , ".$web ." )";
		$isSuccess = insertDeleteUpdateDB($sql, "insert");
	}
	$parameter = 0;
	echo json_encode(array("isEmailUnique" => $uniqueEmail ));
});


?>