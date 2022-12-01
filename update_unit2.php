<?php
if (isset($_COOKIE["username"])) { 
$username = $_COOKIE["username"];
$password = $_COOKIE["password"];

$conn = new mysqli("vconroy.cs.uleth.ca",$username,$password,$username);
$sql = "update unit set unitName='$_POST[unitName]',unitSummary='$_POST[unitSummary]', pointCost = 0, image = 'NULL', factionName='$_POST[factionName]' where unitName='$_POST[oldname]'"; 
if($conn->query($sql)) 
{ 
	echo "<h3> Unit updated!</h3>";

} else {
   $err = $conn->errno(); 
   if($err == 1062)
   {
      echo "<p>Unit name $_POST[unitName] already exists!</p>"; 
   } else {
      echo "error code $err";
   }
   
}

echo "<a href=\"main.php\">Return</a> to Home Page.";

} else {
   echo "<h3>You are not logged in!</h3><p> <a href=\"index.php\">Login First</a></p>"; 
}
?>