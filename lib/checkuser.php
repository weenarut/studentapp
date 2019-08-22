<?php
include 'conn.php';

$username = $_POST['username'];
$password = md5($_POST['password']);

//$username ='571794001';
//$password = md5('1234');

$queryResult=$conn->query("select * from users where id='$username' and password='$password'");
$result=array();

while($fetchData=$queryResult->fetch_assoc())
{
 $result[]=$fetchData;   
}

echo json_encode($result);

?>