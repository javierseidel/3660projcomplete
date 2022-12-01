<?php

if (isset($_COOKIE["username"])) { 
   $username = $_COOKIE["username"];
   $password = $_COOKIE["password"];

   $conn = new mysqli("vconroy.cs.uleth.ca",$username,$password,$username);

   $sql = "insert into faction values ('$_POST[factionName]','$_POST[factionSummary]','$_POST[raceName]')"; 
   if($conn->query($sql)) 
   { 
   
      echo "<p>$_POST[factionName] added!</p> "; 
	
   } else {
      $err = $conn->errno; 
      if($err == 1062)
      {
	 echo "<p>Faction already exists!</p>";
      }
      else if ($err == 1452) {
	 echo "<p>$_POST[raceName] does not exist!</p>"; 
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
 

