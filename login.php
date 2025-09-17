<?php
$conn=mysqli_connect("localhost","root","","prac");
if(!$conn){
    die("INV");
}
$Mobile=$_POST['Mobile'];
$Password=$_POST['Password'];

$sql="Select * FROM customer WHERE Mobile='$Mobile' AND Password='$Password'";
$result=mysqli_query($conn,$sql);
if(mysqli_num_rows($result)>0){

header("Location: next.html");
exit();

}else{
    echo"INV";

mysqli_close($conn);} ?>