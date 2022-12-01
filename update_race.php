<?php

if(isset($_COOKIE["username"]))
{
 echo "<form action=\"updaterace.php\" method=post>";
   $username = $_COOKIE["username"];
   $password = $_COOKIE["password"];

   $conn = new mysqli("vconroy.cs.uleth.ca",$username,$password,$username);
   if($conn->connect_errno)
   {
      echo "Connection issues";
      exit;
   }

   $sql = "select * from race";
   $result = $conn->query($sql);




     echo "Race Name: <select name=\"raceName\">";
     $val = $result->fetch_assoc();
     foreach($result as $val)
     {
  echo "<option value='".$val['raceName']."'>".$val['raceName']."</option>";


     }
     echo "</select>";
     echo "<input type=submit name=\"submit\" value=\"View\">";





}
else
{
   echo "<h3>You are not logged in!</h3><p> <a href=\"index.php\">Login First</a></p>";

}

echo "<a href=\"main.php\">Return</a> to Home Page.";

?>
