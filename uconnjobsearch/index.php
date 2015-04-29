<?php

//SLIM Requirements
require 'Slim/Slim.php';
\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

//Functions for sending data from DB to client
include("/getData.php");
//Functions to handle routing to other pages
include("/routing.php");
//Functions for sending data from client to DB
include("/postData.php");

//Checks to see if user is logged in before redirecting, if not directed to logout screen
function redirectIfLoggedIn($pageToLoad, $app)
{
	session_start();
	if(isset($_SESSION['userName']))
	{
		
		//echo $_SESSION["userName"];
		$app->render($pageToLoad);
	}
	else
	{
		$app->render('loggedout.php');
	}
}
//returns userName in SESSION if it exists, else redirect to login
function safelyGetUserName()
{
	session_start();
	if(isset($_SESSION['userName']))
	{
		return $_SESSION['userName'];
	}
	else
	{
		$app->render('loggedout.php');
	}
}

function connectToDB()
{
	$dbServerName = "localhost";
    $dbUser = "root";
    $dbPassword = "";
    $dbName = "uconnjobsearch";
	
	$result = NULL;
    
	// Create connection
    $conn = new mysqli($dbServerName, $dbUser, $dbPassword, $dbName);
	return $conn;
}

function verifyResultsExist($sql)
{
	$isExist = FALSE;
	$conn = connectToDB();
    // Check connection
    if ($conn->connect_error)
	{
    	die("Connection failed: " . $conn->connect_error);
    }
	else
	{
	    $result = $conn->query($sql);
		if ($result->num_rows == 1)
		{
		    $isExist = TRUE;
		}
		$conn->close();
		return $isExist;
    }
}

function insertDeleteUpdateDB($sql, $method)
{
	$conn = connectToDB();
	$isSuccess = FALSE;
	
	$methodSwitch = ($method === "insert") ? TRUE : (mysqli_affected_rows($conn) == 1); 
	
	if ($conn->connect_error)
	{
    	die("Connection failed: " . $conn->connect_error);
    }
	else
	{
	    $result = $conn->query($sql);
		if ($result && $methodSwitch)
		{
		    $isSuccess = TRUE;
		}
		else
		{
			die("Database Query fail:" .mysqli_error($conn));
		}
		$conn->close();
    }
    return $isSuccess;
} 
 
function verifyUserCredentials($userName, $password)
{
	// Create connection
    $conn = connectToDB();
	
	$isInfoCorrect = FALSE;
	$sql = "CALL verifyUserNameAndPassword( ". $userName .", ". $password .")";
	
	$result = NULL;
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
	    $result = $conn->query($sql);
		
		if ($result->num_rows == 1) {
		    $isInfoCorrect = TRUE;
		} else {
			$isInfoCorrect = FALSE;
		}
		
		$conn->close();
		return $isInfoCorrect;
    }
}
 // Opens and closes a connection to the DB returning its response to provided query
function queryTheDB($sql)
{
	// Create connection
    $conn = connectToDB();
	
	$result = NULL;
	$createdJSON = NULL;

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
	    $result = $conn->query($sql);
		
		if (!$result) {
		    throw new Exception("Database Error [{$this->database->errno}] {$this->database->error}");
		} else {
		    $array = array();
		    while($row = $result->fetch_assoc()) $array[] = $row;
			
			header('Content-Type: application/json');
			$createdJSON .= json_encode($array);
		}
		
		$conn->close();
		return $createdJSON;
    }
}

function replaceWithNull($parameter)
{
	if(!isset($parameter) || trim($parameter)==='')
	{
		$parameter = "NULL";
	}
	return $parameter;
}
//Cleaner way to put parameters into quotes when creating queries
function putInSingleQuotes($parameter)
{
	$parameter = urldecode($parameter);
	$parameter = replaceWithNull($parameter);
	if ($parameter !== "NULL") { $parameter = "'". $parameter . "'"; }
	return $parameter;
}
//Returns an array of bools stating whether job matches a user's given criteria
function checkCriteriaMatchesOnNotApplied($jobID, $userName)
{
	//This is a time consuming call, set max time limit to zero for execution.
	set_time_limit(0);
	//Connect a verify no errors occurred
	$conn = connectToDB();
	if ($conn->connect_error)
	{
    	die("Connection failed: " . $conn->connect_error);
    }
	else
	{
		$sqlSalary = "CALL getJobsForUserBySalaryNotApplied( ". $userName .")";
		$sqlSkills = "CALL getJobsForUserBySkillNotApplied( ". $userName .")";
		$sqlEducation = "CALL getJobsForUserByEducationNotApplied( ". $userName .")";
		$sqlExperience = "CALL getJobsForUserByExperienceNotApplied( ". $userName .")";
		
		$queries = array($sqlSalary, $sqlSkills, $sqlEducation, $sqlExperience );
		//Execute each stored procedure creating temp tables: eduMatchApplied, salaryMatchApplied, skillMatchApplied, expMatchApplied
		foreach($queries as $sql)
		{
			$result = $conn->query($sql);
			if (!$result)
			{
		  	  die("Database Query fail:" .mysqli_error($conn));
			}
		}
		//Match flags for each table
		$eduMatch = FALSE;
		$salaryMatch = FALSE;
		$skillMatch = FALSE;
		$expMatch = FALSE;
		$tempTables = array("eduMatchNotApplied", "salaryMatchNotApplied", "skillMatchNotApplied", "expMatchNotApplied");
		//See if given job exists in each table, toggling flags if it does
		foreach($tempTables as $table)
		{
			$sql = "SELECT * FROM ". $table . " WHERE JobID = ". $jobID;
			$result = $conn->query($sql);
			if ($result->num_rows == 1)
			{
				if($table === "eduMatchNotApplied") $eduMatch = TRUE;
				if($table === "salaryMatchNotApplied") $salaryMatch = TRUE;
				if($table === "skillMatchNotApplied") $skillMatch = TRUE;
				if($table === "expMatchNotApplied") $expMatch = TRUE;
			}
			//Drop temp table when done
			$sql = "DROP TABLE " . $table;
			$result = $conn->query($sql);
			if(!$result)
			{
				die("Database Query fail:" .mysqli_error($conn));
			}
		}
		$flagArray = array
		(
			"MatchEducation" => $eduMatch,
			"MatchSalary" => $salaryMatch,
			"MatchSkill" => $skillMatch,
			"MatchExperience" => $expMatch
		);
		$conn->close();
		return $flagArray;
    }
	
}

function checkCriteriaMatchesOnApplied($jobID, $userName)
{
	//Connect a verify no errors occurred
	$conn = connectToDB();
	if ($conn->connect_error)
	{
    	die("Connection failed: " . $conn->connect_error);
    }
	else
	{
		$sqlSalary = "CALL getJobsForUserBySalaryApplied( ". $userName .")";
		$sqlSkills = "CALL getJobsForUserBySkillApplied( ". $userName .")";
		$sqlEducation = "CALL getJobsForUserByEducationApplied( ". $userName .")";
		$sqlExperience = "CALL getJobsForUserByExperienceApplied( ". $userName .")";
		
		$queries = array($sqlSalary, $sqlSkills, $sqlEducation, $sqlExperience );
		//Execute each stored procedure creating temp tables: eduMatchApplied, salaryMatchApplied, skillMatchApplied, expMatchApplied
		foreach($queries as $sql)
		{
			$result = $conn->query($sql);
			if (!$result)
			{
		  	  die("Database Query fail:" .mysqli_error($conn));
			}
		}
		//Match flags for each table
		$eduMatch = FALSE;
		$salaryMatch = FALSE;
		$skillMatch = FALSE;
		$expMatch = FALSE;
		$tempTables = array("eduMatchApplied", "salaryMatchApplied", "skillMatchApplied", "expMatchApplied");
		//See if given job exists in each table, toggling flags if it does
		foreach($tempTables as $table)
		{
			$sql = "SELECT * FROM ". $table . " WHERE JobID = ". $jobID;
			$result = $conn->query($sql);
			if ($result->num_rows == 1)
			{
				if($table === "eduMatchApplied") $eduMatch = TRUE;
				if($table === "salaryMatchApplied") $salaryMatch = TRUE;
				if($table === "skillMatchApplied") $skillMatch = TRUE;
				if($table === "expMatchApplied") $expMatch = TRUE;
			}
			//Drop temp table when done
			$sql = "DROP TABLE " . $table;
			$result = $conn->query($sql);
			if(!$result)
			{
				die("Database Query fail:" .mysqli_error($conn));
			}
		}
		$flagArray = array
		(
			"MatchEducation" => $eduMatch,
			"MatchSalary" => $salaryMatch,
			"MatchSkill" => $skillMatch,
			"MatchExperience" => $expMatch
		);
		$conn->close();
		return $flagArray;
    }
	
}


//Starts SLIM ****MUST BE CALLED LAST!! *****
$app->run();
