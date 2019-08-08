<?php 

include 'conn.php';

//$act_name = $_POST['Actname'];
//$act_datestart = $_POST['Actdatestart'];
//$act_dateend = $_POST['Actdateend'];
//$act_place = $_POST['Actplace'];

$act_name = '111';
$act_datestart = '222';
$act_dateend = '333';
$act_place = '444';

$con->query("update activity set act_name='".$act_name."',act_datestart='".
$act_datestart."',act_dateend='".$act_dateend."',act_place='".$act_place."' 
where act_id=1");

?>