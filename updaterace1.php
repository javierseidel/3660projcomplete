<?php
if (isset($_COOKIE["username"])) { 
$username = $_COOKIE["username"];
$password = $_COOKIE["password"];

$conn = new mysqli("vconroy.cs.uleth.ca",$username,$password,$username);
$sql = "update race set raceName='$_POST[raceName]',raceSummary='$_POST[raceSummary]' where raceName='$_POST[oldname]'"; 
if($conn->query($sql)) 
{ 
	echo "<h3> Race updated!</h3>";

} else {
   $err = $conn->errno(); 
   if($err == 1062)
   {
      echo "<p>Race name $_POST[raceName] already exists!</p>"; 
   } else {
      echo "error code $err";
   }
   
}

echo "<a href=\"main.php\">Return</a> to Home Page.";

} else {
   echo "<h3>You are not logged in!</h3><p> <a href=\"index.php\">Login First</a></p>"; 
}
?>