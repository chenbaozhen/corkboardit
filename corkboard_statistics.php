<?php
include('login/common.php');
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--    <LINK REL=StyleSheet HREF="layout.css" TYPE="text/css" MEDIA=screen>-->
    <LINK REL=StyleSheet HREF="css/nav.css" TYPE="text/css">
    <LINK REL=StyleSheet HREF="css/statistics.css" TYPE="text/css" MEDIA=screen>
    <title>CorkBoardIT | CorkBoard Statistics</title>
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
            $statquery= sprintf("SELECT G.Email, G.FullName AS User, IFNULL(G.PCCount, 0) AS `Public CorkBoards`, IFNULL(G.PPCount, 0) AS `Public PushPins`, IFNULL(H.VCCount,0) AS `Private CorkBoards`, IFNULL(H.VPCount,0) AS `Private PushPins` 
            FROM (SELECT USER.Email, USER.FullName, PCCount, PPCount
            FROM USER LEFT JOIN  (SELECT A.Email AS Email, A.PCCount, B.PPCount FROM 
            (SELECT PUBLIC_CORKBOARD.OwnerEmail AS Email, COUNT(DISTINCT PUBLIC_CORKBOARD.CB_DateTime) AS PCCount
            FROM PUBLIC_CORKBOARD
            GROUP BY PUBLIC_CORKBOARD.OwnerEmail) AS A NATURAL JOIN
            (SELECT PUBLIC_CORKBOARD.OwnerEmail AS Email, COUNT(*) AS PPCount
            FROM PUBLIC_CORKBOARD NATURAL JOIN PUSHPIN
            GROUP BY PUBLIC_CORKBOARD.OwnerEmail) AS B)  AS F 
            ON USER.Email = F.Email) AS G
            JOIN
            (SELECT USER.Email, USER.FullName, VCCount, VPCount  FROM USER LEFT JOIN  
            (SELECT C.Email AS Email, C.VCCount, D.VPCount FROM
            (SELECT PRIVATE_CORKBOARD.OwnerEmail AS Email, COUNT(DISTINCT PRIVATE_CORKBOARD.CB_DateTime)   AS VCCount
            FROM  PRIVATE_CORKBOARD	
            GROUP BY PRIVATE_CORKBOARD.OwnerEmail) AS C NATURAL JOIN
            (SELECT PRIVATE_CORKBOARD.OwnerEmail AS Email, COUNT(*)  AS VPCount
            FROM PRIVATE_CORKBOARD NATURAL JOIN PUSHPIN 
            GROUP BY PRIVATE_CORKBOARD.OwnerEmail) AS D) AS E
            ON USER.Email = E.Email) AS H ON G.Email = H.Email 
            ORDER BY G.PCCount DESC, H.VCCount DESC
            LIMIT 5");
            echo "<h3 align='left'>CorkBoard Statistics</h3>";
            $result = mysqli_query($db, $statquery);
            $count= mysqli_num_rows($result);

            echo "<table border=1 align='left'><tr class='odd'><td width='35%'>User</td><td>Public CorkBoards</td><td>Public PushPins</td><td>Private CorkBoards</td><td>Private PushPins</td></tr>";

            while ($row = mysqli_fetch_assoc($result)) {   
                echo "<tr ";	
                if ($row['Email']==$_SESSION['myusername']){
                echo "style='color:#FF0000' ";} 
                echo ">";
                echo "<td align='center'>".$row['User']."</td>";
                echo "<td align='center'>".$row['Public CorkBoards']."</td>";
                echo "<td align='center'>".$row['Public PushPins']."</td>";
                echo "<td align='center'>".$row['Private CorkBoards']."</td>";
                echo "<td align='center'>".$row['Private PushPins']."</td>"; 			
                echo "</tr>";
             } 
            echo "</table>";
        ?>
	</div>
	</body>
</html>
