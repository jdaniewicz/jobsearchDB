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


//Starts SLIM ****MUST BE CALLED LAST!! *****
$app->run();
