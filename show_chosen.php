<html>
<head><title>University of Wendy</title></head>
<body>
<?php

try{


if(isset($_COOKIE["username"]))
{
   echo "<form action=\"deleteunit.php\" method=post>";

   $username = $_COOKIE["username"];
   $password = $_COOKIE["password"];

   $conn = new mysqli('vconroy.cs.uleth.ca',$username,$password, $username);
   if($conn->connect_errno)
   {
      echo "Error connecting!";
      exit;
   }

   $sql = "select * from player";
   $result = $conn->query($sql);

   if(!$result)
   {
      echo "Problem with processing query";
      exit;
   }
   else if($result->num_rows > 0)
   {
      echo "Name: <select name=\"unitName\">";

      while($val = $result->fetch_assoc())
      {
	 echo "<option value='".$val['unitName']."'>".$val['unitName']."</option>";
      }
      echo "</select>";
      echo "<input type=submit name=\"submit\" value=\"Delete\">";
   }

   echo "</form>";

   echo "<form action=\"updateunit.php\" method=post>";
   $sql = "select unitName from player";
   $result = $conn->query($sql);

   if(!$result)
   {
      echo "Problem with processing query";
      exit;
   }
   else if($result->num_rows > 0)
   {
      echo "Name: <select name=\"unitName\">";
      

      $val = $result->fetch_assoc();
      foreach($result as $val)
      {
	 echo "<option value='".$val['unitName']."'>".$val['unitName']."</option>";

      }
      echo "</select>";
      echo "<input type=submit name=\"submit\" value=\"Update\">";

   }
   echo "</form>";
}
else echo "<h3>You are not logged in!</h3><p> <a href=\"index.php\">Login First</a></p>";

} catch (PDOException $ex) {

   echo $ex->getMessage();
  }

?>



</body>
</html>
