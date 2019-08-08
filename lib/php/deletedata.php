<?php 

include 'conn.php';

$Act_id = $_POST['Act_id'];

$Act_id = 5;

$conn->query("delete from activity where id=".$Act_id);

?>