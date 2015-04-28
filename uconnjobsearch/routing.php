<?php



/** MATT THIS IS WHERE YOU EDIT AND CREATE PAGE ROUTES **/


// In this case '/' means the page 'test.html' in the templates folder gets pulled up when 
// localhost/uconnjobsearch/"  is entered into the url of the browser
// if you wanted to bring up roflcopter.html page with url localhost/uconnjobsearch/something
// you would replace '/' with '/something' and 'test.html' with 'roflcopter.html' making sure
// roflcopter.html is actually in the templates folder.




/** MINI TEST STATIONS FOR JEFF **/
$app->get('/logout', function() use($app)
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

/****** ROUTES *********************/

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
	redirectIfLoggedIn('figure6.html', $app);
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
	redirectIfLoggedIn('figure9.html', $app);
});

$app->get('/resumeupdateeducation', function() use($app)
{
	$app->render('figure10.html');
});

$app->get('/educationentryscreen', function() use($app)
{
	redirectIfLoggedIn('figure11.html', $app);
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
?>