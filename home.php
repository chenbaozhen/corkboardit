
<style>
    html {
        font-size: 11px;
        font-family: Arial, Helvetica, sans-serif;
    }
	::-webkit-input-placeholder { font-size: 9px; }
::-moz-placeholder { font-size: 9px; } /* firefox 19+ */
:-ms-input-placeholder { font-size: 9px; } /* ie */
input:-moz-placeholder { font-size: 9px; }
</style>


<?php
include('login/common.php');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <LINK REL=StyleSheet HREF="layout.css" TYPE="text/css" MEDIA=screen>
    <LINK REL=StyleSheet HREF="css/nav.css" TYPE="text/css">

            <title>CorkBoartIT | Home</title>
    </head>
	<body>
        <?php include("lib/menu.php"); ?>
	    <div  class="container">
            <div>
                <div class="top-info" > 
                    <caption>
                        
                        <span id = "top-text"> Home Page for </span> 
                        <br>
                        <br>
                        <?php
                        $useremail = $_SESSION['myusername'];
                        $get_name_sql = "SELECT  Fullname from user WHERE Email = '$useremail'";
                        $result = mysqli_query($db, $get_name_sql);
                        if (mysqli_num_rows($result) > 0) {
                        while($row = mysqli_fetch_assoc($result)) {
                            echo "" . $row["Fullname"]. "";
                        }
                        } else {
                            echo "No such User";
                        }
                         //echo $useremail;
                        ?>      
                    </caption>
                </div>
                <div class="top-icon"><img src="images/logo_small.png" alt="logo" /></div>
            </div>
	
            <hr class ="hrline" />
	        <div>
                <form style = "margin-top:10px" name="Popular Tags" action ="popular_tags.php" method="get">
                 <span class="boldtext seg-title" > Recent Corkboard Updates  </span>
                <input  type="submit" name="Submit" value="Popular Tags" style="float: right" />
                </form>
	            
	            <div class="seg-container">
                    <form id="cbupdate-form" border='1'>
                        <tr>
                        <!-- This is an HTML Comment -->
                        </tr>
                            <?php
                            $useremail = $_SESSION['myusername'];
                            $recentcbquery = sprintf("SELECT DISTINCT c.Title, c.Cate_Name, c.CB_DateTime, u.Fullname, c.OwnerEmail, 
                            (case when pu.OwnerEmail is not null and pu.CB_DateTime is not null then 1 else 0 end) as Visibility,
						    max(p.PP_DateTime) as update_Time
                            FROM corkboard c LEFT JOIN user u ON u.Email = c.OwnerEmail LEFT JOIN follows f 
                            ON f.FollowerEmail = '%s' LEFT JOIN watches w ON w.WatcherEmail = '%s' and c.CB_DateTime=w.CB_DateTime
                            LEFT JOIN public_corkboard PU ON c.OwnerEmail=pu.OwnerEmail and c.CB_DateTime=pu.CB_DateTime 
							INNER JOIN pushpin p on c.OwnerEmail=p.OwnerEmail and C.CB_DateTime=p.CB_DateTime
                            WHERE u.Email = '%s' OR u.Email = f.FolloweeEmail OR u.Email = w.OwnerEmail 
							group by c.Title,c.Cate_Name, c.CB_DateTime, u.Fullname, c.OwnerEmail
							ORDER BY update_Time DESC LIMIT 4",
                            mysqli_real_escape_string($db,$_SESSION['myusername']),
                            mysqli_real_escape_string($db,$_SESSION['myusername']),
                            mysqli_real_escape_string($db,$_SESSION['myusername'])
                            );
							//echo $recentcbquery;
							    

                                $result = mysqli_query($db, strtolower($recentcbquery));
								if (mysqli_num_rows($result) == 0) {
									echo "<tr>";
                                    echo "<div style='text-align:left' class='cbupdate-cbname'><td> No Updates.</td></div>"; 
                                    echo "<br />\n";
                                    echo "</tr> <hr class='hrline' >";

								}
                                while ($row = mysqli_fetch_assoc($result)) {
                                    echo "<tr>";
                                    $pinlink = "corkboard_view.php?OwnerEmail=".$row['OwnerEmail']."&CB_DateTime=".urlencode($row['CB_DateTime']);
                                    if ($row['Visibility'] == 0) {
                                    echo "<div style='text-align:left' class='cbupdate-cbname'><td><a href='password_corkboard.php?OwnerEmail=".$row['OwnerEmail']."&CB_DateTime=".urlencode($row['CB_DateTime'])."'>".$row['Title']."</a></td>";
                                    echo '<span style="color:#FF0000 ;"> (private)</span>';echo "</div>";
                                    } else {
                                        echo "<div style='text-align:left' class='cbupdate-cbname'><td><a href=".$pinlink.">".$row['Title']."</a></td></div>";
                                    }   
                                    //echo "<br />\n";
                                    echo "<span class='cbupdate-indent'> Updated By  <td> <span class='boldtext'>".$row['Fullname']."</span> </td>";
                                        //echo "<td>".$row['Cate_Name']."</td>";
                                        echo " on <td><span class='boldtext'>".$row['update_Time']."</span> </span></td>";
                                        echo "<br />\n";
                                    //echo "<td>".$row['Visibility']."</td>";
                                    echo "</tr> <hr class='hrline' >";


                                } 	

                            ?>
                    </form>   
                </div>	 
                <br><br>
                <form name="Add Corkboard" action="corkboard_add.php" method="get">
                    <span class="boldtext seg-title" > My Corkboards </span>
                <input type="submit" name="Submit" value="Add Corkboard" />
               </form>
                
                <div class="seg-container">
                    <form  border='1'   >
                    <tr>
                    </tr>
                    <?php
                    // this code does not work either!
                    $usercbquery= sprintf("
                    SELECT c.Title, c.OwnerEmail,c.CB_DateTime,(case when pu.OwnerEmail is not null and pu.CB_DateTime is not null then 1 else 0 end) as Visibility,count(distinct p.PP_DateTime) as pp_cnt
                    FROM corkboard c 
                    LEFT JOIN public_corkboard PU ON c.OwnerEmail=pu.OwnerEmail and c.CB_DateTime=pu.CB_DateTime 
                    LEFT JOIN pushpin p ON c.OwnerEmail = p.OwnerEmail and c.CB_DateTime=p.CB_DateTime
                    WHERE c.OwnerEmail = '%s'
                    group by c.OwnerEmail,c.CB_DateTime,Visibility
                    ORDER BY c.OwnerEmail,c.CB_DateTime,Visibility DESC",
                    mysqli_real_escape_string($db,$_SESSION['myusername']));
					$result= mysqli_query($db, strtolower($usercbquery));
					if (mysqli_num_rows($result) == 0) {
									echo "<tr>";
									echo "<div style='text-align:left'>";
									echo "<span style='text-align:left' class='cbupdate-cbname'><td>You have no CorkBoards.</td>";
									echo "</span>";
									echo "</div>";
									echo "</tr>";
									echo "<br />\n";
								}
                    while ($row = mysqli_fetch_assoc($result)) {
                            echo "<tr>";
                            echo "<div style='text-align:left'>";
                            $pinlink = "corkboard_view.php?OwnerEmail=".$row['OwnerEmail']."&CB_DateTime=".urlencode($row['CB_DateTime']);
                        if ($row['Visibility'] == 0) {
                        echo "<span style='text-align:left' class='cbupdate-cbname'><td><a href='password_corkboard.php?OwnerEmail=".$row['OwnerEmail']."&CB_DateTime=".urlencode($row['CB_DateTime'])."'>".$row['Title']."</a></td>";
                                    echo '<span style="color:#FF0000 ;"> (private)</span>'; echo "</span>";
                        } else {
                            echo "<td > <span class='cbupdate-cbname'><a href=".$pinlink.">".$row['Title']."</a> </span> </td>";
                        }
                        echo "<td> with <td>".$row['pp_cnt']."</td> PushPins";
                        echo "</div>";
                        echo "</tr>";
                        echo "<br />\n";
                        } 
                    ?>
                    </form>
                    
                </div>
                    <br> <br>
	
	            <hr class ="hrline" />
                <form style = "margin-top:20px" name="Pushpin Search" action="pushpin_search.php" method="get">
                    <input style="margin-left:30px" placeholder="Search description, tags and CorkBoard category" name="p" class="textfield_effect searchbox"/>
                    <input type="submit" name="Submit" value="Pushpin Search" style="float: right" />
                </form>

                   <br>
<!--
                <form name="Popular Sites" action="popular_site.php" method="get">
                    <input style="margin-left:30px" type="submit" name="Submit" value="Popular Sites" />
                </form>
               <form name="CorkBoard Statistics" action="corkboard_statistics.php" method="get">
                    <input style="margin-left:30px" type="submit" name="Submit" value="CorkBoard Statistics" />
               </form>
-->
            </div>
	</div>
   
	</body>
</html>
