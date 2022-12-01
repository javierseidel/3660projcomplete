<html>
<head><title>University of Wendy</title></head>
<body>
<?php

try{


if(isset($_COOKIE["username"]))
{
   echo "<form action=\"delete_race.php\" method=post>";

   $username = $_COOKIE["username"];
   $password = $_COOKIE["password"];

   $conn = new mysqli('vconroy.cs.uleth.ca',$username,$password, $username);
   if($conn->connect_errno)
   {
      echo "Error connecting!";
      exit;
   }

   $sql = "select * from race";
   $result = $conn->query($sql);

   if(!$result)
   {
      echo "Problem with processing query";
      exit;
   }
   else if($result->num_rows > 0)
   {
      $val = $result->fetch_assoc();
      echo "Race Name: <select name=\"raceName\">";

      foreach($result as $val)
      {
         echo "<option value='".$val['raceName']."'>".$val['raceName']."</option>"; 
      }
      echo "</select>";
      echo "<input type=submit name=\"submit\" value=\"Delete\">";

   }

   echo "</form>";
}
else echo "<h3>You are not logged in!</h3><p> <a href=\"index.php\">Login First</a></p>";
echo "<a href=\"main.php\">Return</a> to Home Page.";

} catch (PDOException $ex) {

   echo $ex->getMessage();
  }

?>



</body>
</html>
