<?php

if (isset($_COOKIE["username"])) {
   $username = $_COOKIE["username"];
   $password = $_COOKIE["password"];

   $conn = new mysqli("vconroy.cs.uleth.ca",$username,$password,$username);

   $sql = "insert into player values (0,'$_POST[raceName]','$_POST[factionName]','$_POST[unitName]',NULL)";
   if($conn->query($sql))
   {

      echo "<p>$_POST[unitName] added to Army!</p> ";

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
