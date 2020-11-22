# Crypto Project

>A demo crytpo project in the SwiftUI with clean architecture.


## ***PREVIEW***

| LOGIN PAGE | HOME PAGE |DETAILS PAGE |
|     ------------- | ------------- | ------------- |
| ![Main Page](screenshots/s1.png)| ![Main Page](screenshots/s2.png)|![Main Page](screenshots/s3.png)|


API ENDPOINT CODE IN PHP
====================
```
<?php

//an array to display response
$response = array();

if(isset($_POST['username']) && isset($_POST['password']))
{
    //getting values 
    $username = $_POST['username'];
    $password = $_POST['password'];

        if ($username == "admin" && $password == "admin") {
            $response['status'] = true;
            $response['message'] = "Login successfully";
            echo json_encode($response);
        } 
        else {
            $response['status'] = false;
            $response['message'] = "Incorrect credentials";
            echo json_encode($response);
        }
} 

else {
    $result = array(
        'errorCode' => 406,
        'error' => 'Error! Insufficient parameters'
    );

    echo json_encode($result);
}

?>
```