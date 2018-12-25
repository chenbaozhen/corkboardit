<?php
include('login/common.php');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--        <LINK REL=StyleSheet HREF="layout.css" TYPE="text/css" MEDIA=screen>-->
        <LINK REL=StyleSheet HREF="css/nav.css" TYPE="text/css">
        <LINK REL=StyleSheet HREF="css/pushpin_add.css" TYPE="text/css" MEDIA=screen>
		<title>CorkboardIT | Add Pushpin</title>
	</head>
	<body>
        <?php include("lib/menu.php"); ?>
        <div class="container">
        	
<!--	       <h3>Add PushiPin to Corkboard</h3>-->
            <!-- <img align="center" src="images/logo_small.png" alt="logo" />-->
            <div > 
                <div class="top-info" > 
                    <?php 
                        $CB_DT1=$_POST['CB_DateTime'];
                        $CB_DT2 = str_replace("%3A",":",$CB_DT1);
                        $CB_DateTime = str_replace("+"," ",$CB_DT2);
                         echo "<h1> Add Pushpin </h1>";
                         echo " <span class='top-text'> to ".$_POST['cbtitle']." </span>";
                    ?>
                </div>
                <div class='top-icon'> 
                   <img src='images/pushpin.png' height='40' alt='' /> 
                </div>
                    
                
            </div>
            <div>
            <?php 
                $OwnerEmail=$_POST['OwnerEmail'];
                //echo $OwnerEmail;
                //echo $CB_DateTime;
                echo "<form align='left' method='post' action='createpushpin.php?OwnerEmail=$OwnerEmail&CB_DateTime=".$CB_DateTime."'>";		
                echo "<input type='hidden' name='OwnerEmail' value=".$OwnerEmail.">";
                echo "<input type='hidden' name='CB_DateTime' value=".urlencode($CB_DateTime).">";
            ?>
            <table align="center">
                <tr>
                    <td>
                        URL:
                    </td>
                    <td>
                        <input type="text" name="pushpin_url" class="textInput1"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Description:
                    </td>
                    <td>
                        <input type="text" name="pushpin_description" class="textInput1" style="height:30px;"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Tags (Optional):
                    </td>
                    <td>
                        <input type="text" name="pushpin_tags" class="textInput1" />
                    </td>
                </tr>
                <tr>
                <td></td>
                    <td>
                        <input type="submit" name="Submit" value="Add" class='addppbutton' >
                    </td>
                    </tr>
            </table>
            
            </div>
		</div>
	</body>
</html>

