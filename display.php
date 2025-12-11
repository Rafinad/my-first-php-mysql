<?php
$SQLmydb = mysqli_connect("127.0.0.1", "rafinadik", "Password1","mydb",3306);

if ($SQLmydb == false){
    echo"Ошибка: Невозможно подключиться к MySQL ";
}
else {
    echo"Соединение установлено успешно";
}
$ALLuser = "SELECT u.username as username, GROUP_CONCAT(g.name_group separator '|') as role
FROM 
user u INNER JOIN user_has_Group uhg ON u.user_id = uhg.user_user_id
INNER JOIN mydb.Group g ON g.group_id = uhg.Group_group_id
GROUP BY u.username";
if($result = $SQLmydb->query($ALLuser)){
    foreach($result as $row){
         
        echo "<p>".$row['username']." ".$row['role']."</p>";
    }
}
?>