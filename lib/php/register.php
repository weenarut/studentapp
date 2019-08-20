<?php 
include 'conn.php';

if ($_SERVER['REQUEST_METHOD'=="POST"]){
    $response = array();
    $id = $_POST['id'];
    $password = md5($_POST['password']);
    $name = $_POST['name'];
    $tel = $_POST['tel'];
   
    $insert = "insert into users value ('$id','$password','name','tel','S',now())";
    if (mysqli_query($con,$insert)) {
         $response['value']=1;
         $response['message']="save success";
         echo json_decode($response);
    } else {
         $response['value']=0;
         $response['message']="save fail";
         echo json_decode($response);
    }; 
};
?>

