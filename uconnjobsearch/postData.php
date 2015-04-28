<?php
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
		$responseJSON = array('status' => "success");
	}
	else 
	{
		$responseJSON = array('status' => "failure");
	}
	//Encode array as JSON and send back to client
	echo json_encode($responseJSON);
});

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
?>