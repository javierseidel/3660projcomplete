<?php

if(isset($_COOKIE["username"]))
{
 echo "<form action=\"chooseunit2.php\" method=post>";
   $username = $_COOKIE["username"];
   $password = $_COOKIE["password"];

   $conn = new mysqli("vconroy.cs.uleth.ca",$username,$password,$username);
   if($conn->connect_errno)
   {
      echo "Connection issues";
      exit;
   }


   $sql = "select * from unit where factionName in (select factionName from player)";
   $result = $conn->query($sql);


   $val = $result->fetch_assoc();
   foreach($result as $val)
   {
      echo "<ul><li>$val[unitSummary]</ul></li>";
   }

     echo "Unit Name: <select name=\"unitName\">";

    foreach($result as $val)
     {
  echo "<option value='".$val['unitName']."'>".$val['unitName']."</option>";

     }
     echo "</select>";
     echo "<input type=submit name=\"submit\" value=\"View\">";
     echo "<input type=hidden name=\"raceName\" value=\"$_POST[raceName]\">";
     echo "<input type=hidden name=\"factionName\" value=\"$_POST[factionName]\">";

     //$sqlr = "update player set factionName='".$_POST[factionName]."'";
     //if($conn->query($sqlr)){
     //   echo "<p>Faction Name: $_POST[factionName]</p>";
     //}



}
else
{
   echo "<h3>You are not logged in!</h3><p> <a href=\"index.php\">Login First</a></p>";

}

echo "<a href=\"main.php\">Return</a> to Home Page.";

?>
