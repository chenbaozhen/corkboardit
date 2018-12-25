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
        <title>CorkBoardIT | Popular Sites</title>
    </head>
    <body>
        <?php include("lib/menu.php"); ?>
        
        <div class="container">
            <div class="subcontainer" > 
                <div class="top-icon"><img src="images/logo_small.png" alt="logo" /></div>
            </div>
            <br><br>
            <hr style="border-width: 2px;">
            <?php
                $sitequery= sprintf("SELECT substring_index(substring_index(substring_index(link, 'https://', -1),'http://',-1), '/', 1) as TRUNCATELink,
                count(*) as Pcnt FROM pushpin 
                group by substring_index(substring_index(substring_index(link, 'https://', -1),'http://',-1), '/', 1) 
                order by Pcnt DESC LIMIT 4");
                echo "<h3 align='center'>Popular Sites</h3>";
                $result = mysqli_query($db, $sitequery);
                $count= mysqli_num_rows($result);

                echo "<table border=1 align='center'><tr class='odd'><td>Sites</td><td>Pushpins</td></tr>";

                while ($row = mysqli_fetch_assoc($result)) {      
                    echo "<tr>";
                        echo "<td align='left'><a>".$row['TRUNCATELink']."</a></td>";
                        echo "<td align='left'>".$row['Pcnt']."</td>";                   
                    echo "</tr>";
                 } 
                echo "</table>";
            ?>
        </div>
    </body>
</html>
