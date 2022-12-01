<?php

if (isset($_COOKIE["username"])) {

   $username = $_COOKIE["username"];
   $password = $_COOKIE["password"];

   $conn = new mysqli("vconroy.cs.uleth.ca",$username,$password,$username);

   $sql = "delete from player where unitName='$_POST[unitName]'"; 
   if($conn->query($sql))
   {
	echo "<h3>  deleted!</h3>";
   echo "$_POST[unitName] removed from Army."; 
   } else {
      $err = $conn->errno;
      $errtext = $conn->error;
      echo "You got an error code of $err.";
      echo "Text for this code: $errtext.";
   }
   echo "<br><br><a href=\"main.php\">Return</a> to Home Page.";
} else {

   echo "<h3>You are not logged in!</h3><p> <a href=\"index.php\">Login First</a></p>";

   }
?>
