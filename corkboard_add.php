<style type="text/css">
   .block {
      display: block;
   }
</style>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!--        <LINK REL=StyleSheet HREF="layout.css" TYPE="text/css" MEDIA=screen>-->
        <LINK REL=StyleSheet HREF="css/nav.css" TYPE="text/css">
        <LINK REL=StyleSheet HREF="css/corkboard_add.css" TYPE="text/css" MEDIA=screen>
        <title>CorkBoartIT | Add CorkBoard</title>
    </head>
	<body>
	    <?php include("lib/menu.php"); ?>
		<div align="center" class="container">
          <!-- <img align="center" src="images/logo_small.png" alt="logo" />-->
            <br><br>

            <h2 align="center">Add Corkboard</h2>

            <form align="left" name="addCBForm" method="post" action="corkboard_add_submit.php">
            <table align="center">
                <tr>
                    <td>
                        <span class="boldletters"> Title </span>
                    </td>
                    <td>
                        <input type="text" name="cork_title" class="textInput1" />
                    </td>
                </tr>
                <tr>
                    <td>
                       <span class="boldletters"> Category </span>
                    </td>
                    <td>
                        <select name="cork_category" class="textInput3" > 
                        <!--
                            <option value="dog" >dog </option>
                            <option value="cat" >cat</option>
                            <option value="human" >human</option>
                            <option value="movie" >movie</option>
                            -->
                            <?php
                            include('login/common.php');
                            $catquery = "SELECT name FROM Category";
                            $result = mysqli_query($db,strtolower($catquery));

                            while ($row = mysqli_fetch_assoc($result)) {
                                foreach($row as &$name)
                                {
                                    echo "<option value=".urlencode($name). ">".$name."</option>";
                                }
                            }
                            ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                    <span class="boldletters"> Visibility </span>
                    </td>
                    <td>
                    <label class="block">  <input type="radio" name="private" value="N" id="complete_yes" for="complete_yes">Public</label>
                    </td></tr>
                    <tr>
                    <td></td>
                    <td>
                    <label class="block"><input type="radio" name="private" value="Y" id="complete_no"  for="complete_no">Private 
                    <input type="password" name="cork_pass" class="textInput4" placeholder="Enter Password"/> </label>
                    </td></tr>
                    <tr> <td></td> 
                    <td>
                        <input type="submit" name="Submit" value="Add" >
                    </td>
                </tr>

            </table>

            </form>
        </div>
			<?php
			    echo "<div style='text-align:center'>";
				if($_GET['title_missing']==1){
				echo "Corkboard title is required. Please enter it.";}
				else if ($_GET['visibility_missing']==1){
					echo "Please select corkboard visibility";
				}
				else if($_GET['password_missing']==1){
					echo "Please enter the required password field for a private corkboard. Or change to Public";	
				}
				echo "</div>";
			?>
	</body>
</html>

