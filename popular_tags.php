<?php
include('login/common.php');
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--        <LINK REL=StyleSheet HREF="layout.css" TYPE="text/css" MEDIA=screen>-->
        <LINK REL=StyleSheet HREF="css/nav.css" TYPE="text/css">
        <LINK REL=StyleSheet HREF="css/popular_tags.css" TYPE="text/css" MEDIA=screen>
        <title>CorkBoardIT | Popular Tags</title>
    </head>
    <body>
        <?php include("lib/menu.php"); ?>
<!--
        <div align="center">
        <img src="images/logo_small.png" alt="logo" />
        <br><br>
-->
        
        <div class="container">
            <div class="subcontainer" > 
                <div class="top-icon"><img src="images/logo_small.png" alt="logo" /></div>
            </div>
            <br><br>
            <hr style="border-width: 2px;">
            <?php
                $tagquery= sprintf("SELECT Tag, COUNT(Link), COUNT(DISTINCT c.CB_DateTime) From PushPin p 
                inner join pushpin_tag t on p.OwnerEmail=t.OwnerEmail and p.CB_DateTime=t.CB_DateTime and p.PP_DateTime=t.PP_DateTime 
                inner join corkboard c on c.OwnerEmail=p.OwnerEmail and c.CB_DateTime=p.CB_DateTime 
                GROUP BY Tag 
                ORDER BY COUNT(Link) DESC LIMIT 5");
                echo "<h3 align='left'>Popular Tags</h3>";
                $result = mysqli_query($db, strtolower($tagquery));
                $count= mysqli_num_rows($result);

                echo "<table border=1 align='center'><tr class='odd'><td width='25%'>Tag</td><td width='25%'>Pushpins</td><td width='50%'>Unique Corkboards</td></tr>";

                while ($row = mysqli_fetch_assoc($result)) {      
                    echo "<tr>";
                        //echo "<td align='left'><a>".$row['Tag']."</a></td>";
						echo "<td align='left'><a href='pushpin_search.php?p=".$row['Tag']."&Submit=Pushpin+Search'>".$row['Tag']."</a></td>";
                        echo "<td align='center'>".$row['COUNT(Link)']."</td>";
                        echo "<td align='center'>".$row['COUNT(DISTINCT c.CB_DateTime)']."</td>";                     
                    echo "</tr>";
                 } 
                echo "</table>";
            ?>
        </div>
    </body>
</html>

