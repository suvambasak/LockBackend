<?php

	include('dbconnect.php');
	$response = array();

	function randomPassword() {
	    $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
	    $pass = array();
	    $alphaLength = strlen($alphabet) - 1;
	    for ($i = 0; $i < 33; $i++) {
	        $n = rand(0, $alphaLength);
	        $pass[] = $alphabet[$n];
	    }
	    return implode($pass); //turn the array into a string
	}


	function verifyRequest($con,$androidId,$username,$email){
		$sql = "SELECT * FROM `owner`, `access` WHERE owner.email = '".$email."' AND owner.android_id
 = '".$androidId."' AND access.username = '".$username."' AND owner.email = access.email AND admin = 'Y'";

		$result = mysqli_query($con,$sql);
		$value = @mysqli_num_rows($result);

		if($value){
			$result = mysqli_query($con,"
				DELETE FROM membercode WHERE username = '".$username."'
				");

			return true;
		}
		return false;
	}


	if($_SERVER['REQUEST_METHOD'] == 'POST'){
		if( isset($_POST['androidId']) and 
			isset($_POST['username']) and 
			isset($_POST['email']) 
			) {

			if(verifyRequest($con,$_POST['androidId'],$_POST['username'],$_POST['email'])){

				$code = randomPassword();
				$sql = "INSERT INTO `membercode` (`id`, `username`, `code`) VALUES (NULL, '".$_POST['username']."', '".$code."')";

				$result = mysqli_query($con,$sql);

				$key = $_POST['username'].'/'.$code;

				$response['error'] = false;
				$response['message'] = "Key generated!";
				$response['key'] = $key;


			} else {
				$response['error'] = true;
				$response['message'] = "Something went wrong!";
			}



		} else {
			$response['error'] = true;
			$response['message'] = "Attribute is missing !";
		}	
	}else{
		$response['error'] = true;
		$response['message'] = "Invalid Request";
	}

//encoding array to JSON format for sending for devices.
echo json_encode($response);

?>