<?php

if(isset($_COOKIE["username"]))
{
 echo "<form action=\"updateunit1.php\" method=post>";
   $username = $_COOKIE["username"];
   $password = $_COOKIE["password"];

   $conn = new mysqli("vconroy.cs.uleth.ca",$username,$password,$username);
   if($conn->connect_errno)
   {
      echo "Connection issues";
      exit;
   }

   $sql = "select unitName from unit where factionName in (select factionName from player)";
   $result = $conn->query($sql);




     echo "Unit Name: <select name=\"unitName\">";
     $val = $result->fetch_assoc();
     foreach($result as $val)
     {
  echo "<option value='".$val['unitName']."'>".$val['unitName']."</option>";


     }
     echo "</select>";
     echo "<input type=hidden name=\"oldname\" value=\"$_POST[unitName]\">";
     echo "<input type=submit name=\"submit\" value=\"View\">";





}
else
{
   echo "<h3>You are not logged in!</h3><p> <a href=\"index.php\">Login First</a></p>";

}

echo "<a href=\"main.php\">Return</a> to Home Page.";

?>
