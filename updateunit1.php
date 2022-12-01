<?php

if (isset($_COOKIE["username"])) {
   $username = $_COOKIE["username"];
   $password = $_COOKIE["password"];

   $conn = new mysqli("vconroy.cs.uleth.ca",$username,$password,$username);

   $sql = "update player set unitName = '$_POST[unitName]' where unitName ='$_POST[oldname]' ";
   if($conn->query($sql))
   {

      echo "<p>$_POST[oldname] updated to $_POST[unitName]!</p> ";

   } else {
      $err = $conn->errno;
      if($err == 1062)
      {
	 echo "<p>You already have a unit!</p>";
      }
      else {
	 echo "error number $err";
      }

   }
   echo "<a href=\"main.php\">Return</a> to Home Page.";
} else {
   echo "<h3>You are not logged in!</h3><p> <a href=\"index.php\">Login First</a></p>";

}

?>
