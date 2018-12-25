<?php
include('login/common.php');

$cbquery = sprintf("
	SELECT c.OwnerEmail, u.FullName, c.Cate_Name, c.CB_DateTime,c.Title
        FROM Corkboard c
        LEFT JOIN User AS u ON u.Email = '%s'
        WHERE c.CB_DateTime = '%s' and c.OwnerEmail = '%s'
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
$cbTitle = $row['Title'];
$PP_DateTime = mysqli_real_escape_string($db,$_GET['PP_DateTime']);



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

$likequery = sprintf("
SELECT * FROM Likes
WHERE LikerEmail = '%s'
AND PP_DateTime = '%s'
AND OwnerEmail = '%s'
AND CB_DateTime = '%s'
",
mysqli_real_escape_string($db,$_SESSION['myusername']),
mysqli_real_escape_string($db,$_GET['PP_DateTime']),
mysqli_real_escape_string($db,$cbowner),
mysqli_real_escape_string($db,$_GET['CB_DateTime']));

$likeresult = mysqli_query($db,$likequery);
$liked = 0;
if (mysqli_num_rows($likeresult) != 0) {
	$liked = 1;
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--        <LINK REL=StyleSheet HREF="layout.css" TYPE="text/css" MEDIA=screen>-->
        <LINK REL=StyleSheet HREF="css/nav.css" TYPE="text/css">
        <LINK REL=StyleSheet HREF="css/pushpin_view.css" TYPE="text/css" MEDIA=screen>
        <title>Pushpin</title>
    </head>
    <body>
       <?php include("lib/menu.php"); ?>
        <div class="container">
            
            <?php
            //include 'opendb.php';
            // link, title, email
            ?>
            <div class="subcontainer" > 
                <div class="top-icon"><img src="images/logo_small.png" alt="logo" /></div>
            </div>
            <br><br>
            <hr style="border-width: 2px;">	
            <div class="maincontainer"> 
            <tr>
               <td>
                    <?php
                   echo "<img src='images/pushpin.png'  height='60' alt='' class='pplogo' />";
                        if ($_SESSION['myusername'] != $cbowner && $following == 0) {
                            echo "<form method='post' action='follow.php'>";
                            echo "<input type='hidden' name='back' value=".$_SERVER['REQUEST_URI'].">";	
                            echo "<span id='usernamestyle'>".$cbuser."</span>";
                            echo "     ";
                            echo "<input type='hidden' name='FolloweeEmail' value=".$_GET['OwnerEmail'].">";				
                            echo "<input type='Submit' name='Submit' value='Follow'>";
                            echo "     ";
                            echo "</form>";
                        }
                        else{
                            echo "<span id='usernamestyle'>".$cbuser."</span>";
                            echo "     ";
                            echo "<input type='button' value='Follow' disabled />";
                            echo "<br />\n";
                        }
                    ?>
                </td>
            </tr>

            <tr>
                <td>
                    <?php
                    
                        echo "Pinned  ";
                        $OwnerEmail = $_GET['OwnerEmail'];
                        $CB_DateTime = $_GET['CB_DateTime'];
                        $PP_DateTime = $_GET['PP_DateTime'];
                        $dateQuery = "SELECT PP_DateTime, Description,Link,
                        substring_index(substring_index(substring_index(link, 'https://', -1),'http://',-1), '/', 1) as TRUNCATELink
                        FROM PushPin WHERE PP_DateTime=\"".$PP_DateTime."\" AND OwnerEmail=\"".$OwnerEmail."\" AND CB_DateTime=\"".$CB_DateTime."\"";

                        //echo $dateQuery;
                        $result = mysqli_query($db,$dateQuery);
                        $row = mysqli_fetch_assoc($result);
                        $PP_DateTime = $row['PP_DateTime'];
                        $description = $row['Description'];
                        $link = $row['Link'];
                        $TLink = $row['TRUNCATELink'];
                        //echo $dateQuery;
                        echo $PP_DateTime;
                        echo " on ";

                        $corklink = "corkboard_view.php?OwnerEmail=".$OwnerEmail."&CB_DateTime=".urlencode($CB_DateTime)."";
                        $visquery = "SELECT (case when pu.OwnerEmail is not null and pu.CB_DateTime is not null then 0 else 1 end) as Visibility 
                            FROM Corkboard c left join Public_Corkboard pu on c.OwnerEmail=pu.OwnerEmail and c.CB_DateTime=pu.CB_DateTime
                                WHERE c.CB_DateTime=\"".$CB_DateTime."\" AND c.OwnerEmail=\"".$OwnerEmail."\"";
                        $result = mysqli_query($db,$tempquery);
                        $row = mysqli_fetch_assoc($result);

                        if ($row['Visibility'] == 1) {
                        echo "<td><a href='password_corkboard.php?OwnerEmail=".$OwnerEmail."&CB_DateTime=".urlencode($CB_DateTime)."'>".$cbTitle."</a></td>";
                        } else {
                            echo "<td><a class='boldletters' href='corkboard_view.php?OwnerEmail=".$OwnerEmail."&CB_DateTime=".urlencode($CB_DateTime)."'>".$cbTitle."</a></td>";
                            }
                        
                        echo "<hr>";
                        $userquery = "SELECT FullName FROM User WHERE Email=\"".$OwnerEmail."\"";

                        $result = mysqli_query($db,$userquery);
                        $row = mysqli_fetch_assoc($result);
                        $user = $row['FullName'];
//                        echo "<br>";
                        echo "<div align= 'right' class='fromsite'> from   ".$TLink." </div>";
                        
                        
                    ?>
                </td>
            </tr>
        

            <tr>
                <td>
                    <a href="<?php echo $link;?>">
                        <img class="pushpinMain" src="<?php echo $link;?>"/>
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <a ><?php
                        echo "<br>";
                        echo "<span class='description1'> &nbsp&nbsp&nbsp&nbsp".$description."</span>";
                        echo "<br>";
                    ?></a>
                </td>
            </tr>
            <tr>
                <td>
                    <a> <span class='description1'>&nbsp&nbsp&nbsp&nbspTags: </span> 
                       <span class='boldletters'> 
                            <?php 
                                $tagquery = "SELECT Tag FROM PushPin_Tag WHERE PP_DateTime=\"".$PP_DateTime."\" AND OwnerEmail=\"".$OwnerEmail."\" AND CB_DateTime=\"".$CB_DateTime."\"";
                                //echo $tagquery;
                                $tags = mysqli_query($db,$tagquery);
                                $num_tag = mysqli_num_rows($tags);
                                $i = 0;
                                while ($row = mysqli_fetch_assoc($tags)) {
                                    foreach($row as &$tag)
                                    {
                                        if(++$i != $num_tag){
                                                echo "".$tag.", ";
                                    }
                                    else{
                                        echo "".$tag." ";
                                    }
                                    }
                                }
                            ?>
                        </span>
                    </a>
                </td>
            </tr>
            <tr>
                <td>  <hr class ="hrline" />
                    <?php
                        //echo "like email";
                        //echo urlencode($CB_DateTime);
                        $likequery = "SELECT LikerEmail,FullName FROM Likes INNER JOIN USER U ON LikerEmail=U.Email
                        WHERE OwnerEmail=\"".$OwnerEmail."\" AND PP_DateTime=\"".$PP_DateTime."\" AND LikerEmail=\"".$_SESSION['myusername']."\" AND CB_DateTime=\"".$CB_DateTime."\"";
                        $likerquery = "SELECT LikerEmail,FullName FROM Likes INNER JOIN USER U ON LikerEmail=U.Email
                        WHERE OwnerEmail=\"".$OwnerEmail."\" AND PP_DateTime=\"".$PP_DateTime."\" AND CB_DateTime=\"".$CB_DateTime."\"";
                        $result = mysqli_query($db,$likequery);
                        $liked = mysqli_num_rows($result); 

                        $liker = mysqli_query($db,$likerquery);
                        $num_liker = mysqli_num_rows($liker);
                        $i = 0;
                        echo "<form method='post' action='like.php'>";
                        echo "<img src='images/thumb.jpg' class='thumblogo' width='25' title='thumb' alt='' />";
                        echo "<span class='boldletters'> ";
                        while ($row = mysqli_fetch_assoc($liker)) {
                            ++$i;
                            if($i != $num_liker-1 && $i !=$num_liker){
                                echo "".$row['FullName'].", ";
                            }
                            else if($i == $num_liker-1 ) {
                                echo "".$row['FullName']." and ";
                            }
                            else{
                                echo "".$row['FullName']."  ";
                            }
                        }
                        echo "</span>";
                        echo    "<input type='hidden' name='back' value=".$_SERVER['REQUEST_URI'].">";
                        echo	"<input type='hidden' name='PP_DateTime' value=".urlencode($PP_DateTime).">";
                        echo	"<input type='hidden' name='OwnerEmail' value=".$OwnerEmail.">";
                        echo	"<input type='hidden' name='CB_DateTime' value=".urlencode($CB_DateTime).">";
                        if ($liked == 0 and $OwnerEmail!=$_SESSION['myusername']) {					
                        echo	"<input class='addppbutton' type='submit' name='LikeOrNot' value='Like!'>";

                        }
                        else if ($OwnerEmail!=$_SESSION['myusername']){
                            echo "<input class='addppbutton'  type='submit' name='LikeOrNot' value='UnLike!'>";
                        }   
                        else {
                            echo	"<input class='addppbutton'  type='submit' name='LikeOrNot' value='Like!' disabled>";
                        }
                        
                        
                            echo "</form>";
                    ?> 
                </td>
            </tr>
            <hr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <form action ="make_comment.php" method="get">				<td>
                    <input type="hidden" name="PP_DateTime" value=<?php echo urlencode($PP_DateTime); ?> >
                <input type="hidden" name="CB_DateTime" value=<?php echo urlencode($CB_DateTime); ?>/>
                <input type="hidden" name="OwnerEmail" value=<?php echo $OwnerEmail; ?>/>
                <input type="hidden" name="back" value=<?php echo $_SERVER['REQUEST_URI']; ?>/>
                </td>
                <td>
                    <input style="margin-left:15px" class="textInput1" type="text" name="pushpin_comment" placeholder="Enter Comment"/>
                </td>
                <td>
                    <input type="Submit"  value="Post Comment" class='addppbutton' style="height:30px"/>
                </td>

                </form>
            </tr>
            <tr>
                <td><hr></td>
            </tr>
            <?php

                $commentquery = "SELECT u.FullName, Text, Com_DateTime FROM Comment c INNER JOIN USER U ON U.Email=C.CommenterEmail
                WHERE PP_DateTime=\"".$PP_DateTime."\" AND OwnerEmail=\"".$OwnerEmail."\" AND CB_DateTime=\"".$CB_DateTime."\"
				order by Com_DateTime desc";

                $result = mysqli_query($db,$commentquery);
                //echo $commentquery;
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<span class='boldletters' >".$row['FullName']."</span>";
                    echo ":   ";
                    echo "<tr><td>";
                    echo "".$row['Text']."";
                    echo "</td><td>";
                    echo "<tr><td></td><td></td><td></td></tr></br>";
                }

             ?>
            </div>
        </div>
    </body>
</html>
