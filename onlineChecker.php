<?php
//login and singin for lock.

//connecting DB
include('dbconnect.php');

//array for encoding data to JSON.
$response = array();


//check for existing username and email.
function isUserExist($con,$androidId,$username,$email){
	$sql = "SELECT * FROM `access`,`owner` WHERE owner.email = access.email AND owner.android_id = '".$androidId."' AND owner.email='".$email."' AND access.username='".$username."' AND access.enable = 'Y'";

	$result = mysqli_query($con,$sql);
	$value = @mysqli_num_rows($result);

	if ($value){
		return true;
	}else{
		return false;
	}
}


//server request method.
if($_SERVER['REQUEST_METHOD'] == 'POST'){

	//checking for not null value.
	if(
		isset($_POST['username']) and
		isset($_POST['androidId']) and 
		isset($_POST['email']) ) {


		if (isUserExist($con,$_POST['androidId'],$_POST['username'],$_POST['email'])){
			//query for checking username and password.
			$sql = "SELECT * FROM onlinelist WHERE username = '".$_POST['username']."'";

			//executing query,
			$result = mysqli_query($con,$sql);
			//fetching reqults.
			$value = @mysqli_num_rows($result);

			//when username and password is valid.
			if ($value){
				//fetching info.
				//$row = mysqli_fetch_array($result, MYSQLI_ASSOC);


				//creating reply.
				$response['error'] = false;
				$response['message'] = "Found";
				
				//$response['id'] = $row['id'];
				$response['status'] = "Online";


			}else{

				//reply when username and password is not valid.
				$response['error'] = true;
				$response['message'] = "Not Found";
				$response['status'] = "Offline";
			}
		}else{
			//when username and android is null.
			$response['error'] = true;
			$response['message'] = "Permission deny";	
			$response['status'] = "Access Deny";
		}

	}else{

		//when username and android is null.
		$response['error'] = true;
		$response['message'] = "username and android ID not found";
	}
}else{
	
	//when request method is not POST
	$response['error'] = true;
	$response['message'] = "Invalid Request";
}

//encoding array to JSON format for sending for devices.
echo json_encode($response);
?>