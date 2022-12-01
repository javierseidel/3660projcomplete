<?php

if(isset($_COOKIE["username"]))
{
     echo "<form action=\"choose_unit.php\" method=post>";
   $username = $_COOKIE["username"];
   $password = $_COOKIE["password"];

   $conn = new mysqli("vconroy.cs.uleth.ca",$username,$password,$username);
   if($conn->connect_errno)
   {
      echo "Connection issues";
      exit;
   }


   $sql = "select * from faction where raceName='".$_POST[raceName]."'";
   $result = $conn->query($sql);



   $val = $result->fetch_assoc();
   foreach($result as $val)
   {
      echo "<ul><li>$val[factionSummary]</ul></li>";
   }

     echo "Faction Name: <select name=\"factionName\">";

     foreach($result as $val)
     {
  echo "<option value='".$val['factionName']."'>".$val['factionName']."</option>";

     }
     echo "</select>";
     echo "<input type=submit name=\"submit\" value=\"View\">";
     echo "<input type=hidden name=\"raceName\" value=\"$_POST[raceName]\">";
     

    // $sqlr = "update player set raceName='".$_POST[raceName]."'";
    // if($conn->query($sqlr)){
    //    echo "<p>Race Name: $_POST[raceName]</p>";
    // }



}
else
{
   echo "<h3>You are not logged in!</h3><p> <a href=\"index.php\">Login First</a></p>";

}

echo "<a href=\"main.php\">Return</a> to Home Page.";

?>
