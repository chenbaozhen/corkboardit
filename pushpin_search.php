<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!--        <LINK REL=StyleSheet HREF="layout.css" TYPE="text/css" MEDIA=screen>-->
        <LINK REL=StyleSheet HREF="css/nav.css" TYPE="text/css">
        <LINK REL=StyleSheet HREF="css/popular_tags.css" TYPE="text/css" MEDIA=screen>
                <title>CorkBoardIT | Search Pushpins</title>
	</head>
	<body>
        <?php include("lib/menu.php"); ?>
        <div class="container">
            <div class="subcontainer" > 
                <div class="top-icon"><img src="images/logo_small.png" alt="logo" /></div>
            </div>
            <br><br>
            <hr style="border-width: 1px;">
            <?php
                include('login/common.php');
                $pp = @$_GET['p'] ;
                $trimmedPP=$pp;
                //$trimmedPP = trim($pp); //trim whitespace from the stored variable

                $limit=10;

                if(isset($pp)){
                    $query = "SELECT distinct p.PP_DateTime,p.Description,p.CB_DateTime,p.OwnerEmail,p.Link, c.title,u.FullName FROM  PushPin p 
                    LEFT JOIN Corkboard c ON c.CB_DateTime= p.CB_DateTime and c.OwnerEmail=P.OwnerEmail
                    INNER JOIN PUBLIC_CORKBOARD pc on c.CB_DateTime=pc.CB_DateTime and c.OwnerEmail=pc.OwnerEmail
                    LEFT JOIN USER u ON P.OwnerEmail=u.Email
                    LEFT JOIN PushPin_Tag PT on P.OwnerEmail = PT.OwnerEmail AND p.CB_DateTime=pt.CB_DateTime AND p.PP_DateTime=pt.PP_DateTime
                    WHERE  P.Description LIKE '%$trimmedPP%' OR pt.Tag LIKE '%$trimmedPP%' OR c.Cate_Name LIKE '%$trimmedPP%'
                    ORDER BY Description";
                    //echo $query;
                    //$query1 = "SELECT p.Description,p.CorkboardTitle,p.Email,p.Link FROM PushPin p  WHERE c.CatName= 'Pets'";
                     $numresults=mysqli_query($db,$query);
                     $numrows=mysqli_num_rows($numresults);

                    // next determine if s has been passed to script, if not use 0
                      if (empty($s)) {
                      $s=0;
                      }


                      $result = mysqli_query($db,$query);

                    // display what the person searched for
                     echo "<h3 align='left'> PushPin Search Results </h3>";
                    //echo "You searched for: &quot;" . $pp . "&quot; returned " .$numrows." result(s).";


                    // begin to show results set
                    echo "<table border=1 align='center'><tr class='odd'><td>Pushpin Description</td><td>Corkboard</td><td>Owner</td></tr>";

                    while ($row = mysqli_fetch_assoc($result)) {      
                        echo "<tr>";
                            echo "<td align='left'><a href='pushpin_view.php?OwnerEmail=".$row['OwnerEmail']."&CB_DateTime=".$row['CB_DateTime']."&PP_DateTime=".$row['PP_DateTime']."'>".$row['Description']."</a></td>";
                            echo "<td align='left'>".$row['title']."</td>";
                            echo "<td align='left'>".$row['FullName']."</td>";                     
                        echo "</tr>";
                     } 
                    echo "</table>";

                    echo"<br/>";
                    echo"<br/>";
                } else {
                    echo "Unable to perform search. Parameters missing.";
                }

            ?>
        </div>
	</body>
</html>

