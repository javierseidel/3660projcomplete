<?php

if (isset($_COOKIE["username"])) { 
   $username = $_COOKIE["username"];
   $password = $_COOKIE["password"];

   $conn = new mysqli("vconroy.cs.uleth.ca",$username,$password,$username);

   $sql = "insert into unit values ('$_POST[unitName]','$_POST[unitSummary]','$_POST[unitCost]', 'NULL', '$_POST[factionName]')"; 
   if($conn->query($sql)) 
   { 
   
      echo "<p>$_POST[unitName] added!</p> "; 
	
   } else {
      $err = $conn->errno; 
      if($err == 1062)
      {
	 echo "<p>Unit already exists!</p>";
      }
      else if ($err == 1452) {
	 echo "<p>$_POST[factionName] does not exist!</p>"; 
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
 

