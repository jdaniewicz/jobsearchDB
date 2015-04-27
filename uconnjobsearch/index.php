<?php
/**
 * Step 1: Require the Slim Framework
 *
 * If you are not using Composer, you need to require the
 * Slim Framework and register its PSR-0 autoloader.
 *
 * If you are using Composer, you can skip this step.
 */
require 'Slim/Slim.php';

\Slim\Slim::registerAutoloader();

/**
 * Step 2: Instantiate a Slim application
 *
 * This example instantiates a Slim application using
 * its default settings. However, you will usually configure
 * your Slim application now by passing an associative array
 * of setting names and values into the application constructor.
 */
$app = new \Slim\Slim();

/**
 * Step 3: Define the Slim application routes
 *
 * Here we define several Slim application routes that respond
 * to appropriate HTTP request methods. In this example, the second
 * argument for `Slim::get`, `Slim::post`, `Slim::put`, `Slim::patch`, and `Slim::delete`
 * is an anonymous function.
 */

function verifyUserCredentials($userName, $password)
{
	$isInfoCorrect = FALSE;
	$sql = "CALL verifyUserNameAndPassword( ". $userName .", ". $password .")";
	
	$dbServerName = "localhost";
    $dbUser = "root";
    $dbPassword = "";
    $dbName = "uconnjobsearch";
	
	$result = NULL;
    
	// Create connection
    $conn = new mysqli($dbServerName, $dbUser, $dbPassword, $dbName);

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
	$dbServerName = "localhost";
    $dbUser = "root";
    $dbPassword = "";
    $dbName = "uconnjobsearch";
	
	$result = NULL;
	$createdJSON = NULL;
    
	// Create connection
    $conn = new mysqli($dbServerName, $dbUser, $dbPassword, $dbName);

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

//Cleaner way to put parameters into quotes when creating queries
function putInSingleQuotes($parameter)
{
	$parameter = urldecode($parameter);
	return "'". $parameter . "'";
}

/** MATT THIS IS WHERE YOU EDIT AND CREATE PAGE ROUTES **/


// In this case '/' means the page 'test.html' in the templates folder gets pulled up when 
// localhost/uconnjobsearch/"  is entered into the url of the browser
// if you wanted to bring up roflcopter.html page with url localhost/uconnjobsearch/something
// you would replace '/' with '/something' and 'test.html' with 'roflcopter.html' making sure
// roflcopter.html is actually in the templates folder.


/** MINI TEST STATIONS FOR JEFF **/
$app->get('/logout/', function() use($app)
{
	session_start();
	if(isset($_SESSION['userName']))
	{
		
		session_destroy();
		echo "YOU HAVE LOGGED OUT!";
		//$app->render('hello.php');
	}
	else
	{
		echo "YOU AREN'T LOGGED IN!";
	}
});

$app->get('/test2', function() use($app)
{
	session_start();
	if(isset($_SESSION['userName']))
	{
		
		echo $_SESSION["userName"];
		//$app->render('hello.php');
	}
	else
	{
		echo "YOU AREN'T LOGGED IN!";
	}
});
/**********************************/

$app->get('/login', function() use($app)
{
	$app->render('figure1.html');
});

$app->get('/newuser', function() use($app)
{
	$app->render('figure3.html');
});

$app->get('/main', function() use($app)
{
	$app->render('figure6.html');
});

$app->get('/searchscreen', function() use($app)
{
	$app->render('figure7.html');
});

$app->get('/manageapplications', function() use($app)
{
	$app->render('figure8.html');
});

$app->get('/resumeupdate', function() use($app)
{
	$app->render('figure9.html');
});

$app->get('/resumeupdateeducation', function() use($app)
{
	$app->render('figure10.html');
});

$app->get('/educationentryscreen', function() use($app)
{
	$app->render('figure11.html');
});

$app->get('/resumeupdateexperience', function() use($app)
{
	$app->render('figure12.html');
});

$app->get('/experienceentry', function() use($app)
{
	$app->render('figure13.html');
});

$app->get('/updateskill', function() use($app)
{
	$app->render('figure14.html');
});

$app->get('/updateprofile', function() use($app)
{
	$app->render('figure15.html');
});

$app->get('/jobdetailscreen', function() use($app)
{
	$app->render('figure16.html');
});

/*********************************************************/


/** Handle AJAX requests for GET and POST **/
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

//Verifying Log in credentials
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
		//Redirect to page after login
		$responseJSON = array('status' => "success");
	}
	else 
	{
		$responseJSON = array('status' => "failure");
	}
	//Encode array as JSON and send back to client
	echo json_encode($responseJSON);
});


$app->run();
