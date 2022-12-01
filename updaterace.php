<?php
if(isset($_COOKIE["username"])){

echo "<form action=\"updaterace1.php\" method=post>";

	$username = $_COOKIE["username"];
	$password = $_COOKIE["password"];	

	$conn = new mysqli("vconroy.cs.uleth.ca",$username,$password,$username);
	if($conn->connect_errno)
	{
	   echo "Connection Problem!";
	   exit; 
	}
	
	$sql = "select * from race where raceName='$_POST[raceName]'";

	$result = $conn->query($sql);
	if(!$result)
	{
	   echo "Problem executing select!";
	   exit; 
	}
        if($result->num_rows!= 0)
	{
	   $rec=$result->fetch_assoc(); 
	   echo "Race Name: <input type=text name=\"raceName\" value=\"$rec[raceName]\"><br><br>";
	   echo "Race Description: <input type=text name=\"raceSummary\" value=\"$rec[raceSummary]\"><br><br>";
	   echo "<input type=hidden name=\"oldname\" value=\"$_POST[raceName]\">";
	   echo "<input type=submit name=\"submit\" value=\"Update\">"; 

	}
	else
	{
		echo "<p>Umm...you may want to enter some data. ;) </p>"; 
	}

	echo "</form>";
} else {
   echo "<h3>You are not logged in!</h3><p> <a href=\"index.php\">Login First</a></p>"; 

}
?>