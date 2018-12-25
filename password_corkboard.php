<?php
include('login/common.php');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<LINK REL=StyleSheet HREF="layout.css" TYPE="text/css" MEDIA=screen>
		<title>Viewing Private Corkboard</title>
	</head>
	<body>
	<div align="center">
	<h3>Password Protected</h3>
		<!-- <img align="center" src="images/logo_small.png" alt="logo" />-->
		<br><br>
		<!-- <h2 align="center"> Private Corkboard Password</h2> -->
		<!-- <p align="center">The Corkboard you wish to open is private. -->
		<!-- ––Please enter password for Corkboard: </p> -->
		
		<div class="box" align="center">
			<img src="images/corkboard_password.png" />
			</div>
		<form align="center" method="post" action="checkpassword.php">
		<?php
			echo "<input type='hidden' name='OwnerEmail' value=".$_GET['OwnerEmail']." />";
			echo "<input type='hidden' name='CB_DateTime' value=".urlencode($_GET['CB_DateTime'])." />";
			//echo "<input type='hidden' name='CB_DateTime' value=".$_GET['CB_DateTime']." />";
		?>		
		<br><br>
		<table align="center" >
			<tr>
				<td>
					Password:
				</td>
				<td>
					<input type="password" name="cork_pass" />
				</td>
			</tr>
			<td></td>
				<td>
					<input type="submit" name="Cancel" value="Cancel" >
				</td>
				<td>
					<input type="submit" name="Submit" value="OK" >
				</td>
		</table>
				<?php
					include('common.php');
					if($_GET['password_wrong']==1){
						echo "Corkboard Password is wrong!";
						//header("location:password_corkboard.php");
								}
				?>
		</div>		
	</body>
</html>

