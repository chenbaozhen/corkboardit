<?php
    include('login/common.php');
    $cbquery = sprintf("
        SELECT c.OwnerEmail, u.FullName, c.Cate_Name, c.CB_DateTime, c.Title, max(PP_DateTime) as PP_DateTime2
            FROM Corkboard c
            LEFT JOIN User AS u ON u.Email = '%s'
			LEFT JOIN PushPin P on c.OwnerEmail=p.OwnerEmail and c.CB_DateTime=p.CB_DateTime
            WHERE c.CB_DateTime = '%s' and c.OwnerEmail = '%s'
			group by c.OwnerEmail, u.FullName, c.Cate_Name, c.CB_DateTime, c.Title
            LIMIT 1
        ",
        mysqli_real_escape_string($db,$_GET['OwnerEmail']),
        mysqli_real_escape_string($db,$_GET['CB_DateTime']),
        mysqli_real_escape_string($db,$_GET['OwnerEmail'])
    );

    $result = mysqli_query($db,$cbquery);
    $row = mysqli_fetch_assoc($result);
    $cbuser = $row['FullName'];
    $cbcat = $row['Cate_Name'];
    $cbowner = $row['OwnerEmail'];
    $cbtitle = $row['Title'];
	//echo $cbquery;


    $followquery = sprintf("
    SELECT * FROM Follows
    WHERE FollowerEmail = '%s'
    AND FolloweeEmail = '%s'",
    mysqli_real_escape_string($db,$_SESSION['myusername']),
    mysqli_real_escape_string($db,$cbowner));
    $followresult = mysqli_query($db,$followquery);
    $following = 0;
    if (mysqli_num_rows($followresult) != 0) {
        $following = 1;
    }

    $watchquery = sprintf("
    SELECT * FROM Watches w 
    WHERE WatcherEmail = '%s'
    AND CB_DateTime = '%s'
    AND OwnerEmail = '%s'",
    mysqli_real_escape_string($db,$_SESSION['myusername']),
    $_GET['CB_DateTime'],
    mysqli_real_escape_string($db,$cbowner));
    $watchresult = mysqli_query($db,$watchquery);
    $watching = 0;
    if (mysqli_num_rows($watchresult) != 0) {
        $watching = 1;
    }

    $visquery = sprintf("
    SELECT * FROM private_corkboard w 
    WHERE CB_DateTime = '%s'
    AND OwnerEmail = '%s'",
    $_GET['CB_DateTime'],
    mysqli_real_escape_string($db,$cbowner));
    $visresult = mysqli_query($db,$visquery);
    $visbility = 1;
    if (mysqli_num_rows($visresult) != 0) {
        $visbility = 0;
    }

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--        <LINK REL=StyleSheet HREF="layout.css" TYPE="text/css" MEDIA=screen>-->
        <LINK REL=StyleSheet HREF="css/nav.css" TYPE="text/css">
        <LINK REL=StyleSheet HREF="css/corkboard_view.css" TYPE="text/css" MEDIA=screen>
        <title>
            <?php 
            //echo $_GET["title"];
            echo $cbtitle;
            ?>
        </title>
	</head>
	<body>
       <?php include("lib/menu.php"); ?>
        <div class="container">
            <div class="subcontainer" > 
                <div class="top-icon"><img src="images/logo_small.png" alt="logo" /></div>
            </div>
            <br><br>
            <hr style="border-width: 2px;">
            <div class="maincontainer"> 
            
                <tr>
                    <?php
                        if ($_SESSION['myusername'] != $cbowner && $following == 0) {
                            echo "<form method='post' action='follow.php'>";
                            echo "<input type='hidden' name='back' value=".$_SERVER['REQUEST_URI'].">";	
                            echo "<span id='usernamestyle'>".$cbuser."</span>";
                            echo "     ";
                            echo "<input type='hidden' name='FolloweeEmail' value=".$_GET['OwnerEmail'].">";				
                            echo "<input type='Submit' name='Submit' value='Follow'>";
                            echo "     ";
                            echo "<span class='categarystyle'>".$cbcat."</span>";
                            echo "</form>";
                        }
                        else{
                            echo "<span id='usernamestyle'>".$cbuser."</span>";
                            echo "     ";
                            echo "<input type='button' value='Follow' disabled />";
                            echo "     ";
                            echo "<span class='categarystyle'>".$cbcat."</span>";
                            echo "<br />\n";
                        }
                    ?>
                    <td>
                        <?php 
                            //echo $_GET["title"];
                            echo "<span id='cbnamestyle'>".$cbtitle."</span>";
                            echo "<br />\n";
                        ?>
                    </td>
                    <?php
                        echo "<form method='post' action='pushpin_add.php'>";
                        echo " Last Updated ";
                        
						if($row['PP_DateTime2'] === NULL){echo mysqli_real_escape_string($db,$_GET['CB_DateTime']);}
						else{echo $row['PP_DateTime2'];}
                        echo "   ";
                    if ($_SESSION['myusername'] == $cbowner) {	
                        echo	"<input type='hidden' name='OwnerEmail' value=".$cbowner.">";
                        echo	"<input type='hidden' name='cbtitle' value=".$cbtitle.">";
                        echo	"<input type='hidden' name='CB_DateTime' value=".urlencode($_GET['CB_DateTime']).">";				
                        echo	"<input type='submit' class='addppbutton' style='font-size:15px' value='Add Pushpin'>";

                    }
                    else{
                        echo	"<input type='submit' value='Add Pushpin' disabled>";
                    }
                       echo "</form>";
                    ?>
                </tr>
                
                <hr style="border-width: 2px;">
               
                <?php
                    $cbtnquery = sprintf("
                        SELECT DISTINCT Link,PP_DateTime
                            FROM PushPin
                            WHERE OwnerEmail = '%s'
                        AND CB_DateTime = '%s'	
                        ",
                        mysqli_real_escape_string($db,$_GET['OwnerEmail']),
                        mysqli_real_escape_string($db,$_GET['CB_DateTime'])
                    );
                    $result = mysqli_query($db,$cbtnquery);
                    while ($row = mysqli_fetch_assoc($result)) {
                        $link = $row['Link'];
                        $OwnerEmail = $_GET['OwnerEmail'];
                        $CB_DateTime = $_GET['CB_DateTime'];
                        $PP_DateTime = $row['PP_DateTime'];
                        echo "<td>
                            <a href='pushpin_view.php?OwnerEmail=".$OwnerEmail."&CB_DateTime=".$CB_DateTime."&PP_DateTime=".$PP_DateTime."'>
                                <img class='thumb' src='$link'/>
                            </a>
                        </td>";
                    }
                ?>	
                <hr style="border-width: 2px;">
                <tr>

                <br />
                </tr>		
                <tr>
                    <td> <?php 
                        echo "<td><form method='post' action='watch.php'>";
                        echo "<img  style='height: 15px;' src='./images/glass.svg'/> <span class='fontmiddle'>&nbsp&nbsp This CorkBoard has </span>";
                        $watcherquery = sprintf("
                        SELECT COUNT(OwnerEmail) 
                        FROM Watches
                        WHERE CB_DateTime = '%s'
                        AND OwnerEmail = '%s'",
                    $_GET['CB_DateTime'],
                    mysqli_real_escape_string($db,$OwnerEmail));
                        $result = mysqli_query($db,$watcherquery);
                        $row = mysqli_fetch_assoc($result);
                        echo "<span class='boldletters'> ".$row['COUNT(OwnerEmail)']."</span> <span class='fontmiddle'>";
                        echo "watchers. </span>";
                        //echo $watcherquery;		
                    if ($_SESSION['myusername'] != $cbowner && $watching == 0 && $visbility==1 && $following == 0) {	
                        echo    "<input type='hidden' name='back' value=".$_SERVER['REQUEST_URI'].">";
                        echo	"<input type='hidden' name='OwnerEmail' value=".$cbowner.">";
                        //echo	"<input type='hidden' name='title' value=".$_GET['title'].">";	
                        echo	"<input type='hidden' name='CB_DateTime' value=".urlencode($_GET['CB_DateTime']).">";	
                        echo	"<input type='submit' value='Watch'>";
                    }
                    else{
                        echo "<input class='addppbutton' type='button' value='Watch' disabled />";
                    }
                        echo "</form></td>";
                        echo "<br />\n";
                    ?>
                <tr>
                <!-- </table>-->




            </div>
        </div>
	</body>
</html>
