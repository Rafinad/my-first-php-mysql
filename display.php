<?php
$SQLmydb = mysqli_connect("127.0.0.1", "rafinadik", "Password1","mydb",3306);
$authorization = false;
$ALLuser = "SELECT u.username as username, GROUP_CONCAT(g.name_group separator '|') as role
FROM 
user u INNER JOIN user_has_Group uhg ON u.user_id = uhg.user_user_id
INNER JOIN mydb.Group g ON g.group_id = uhg.Group_group_id
GROUP BY u.username";
$username= $_POST["username"];
$password_from_HTML = $_POST["password"];
$SelectPassword = "SELECT password FROM user WHERE username='$username'";
if($result = $SQLmydb->query($SelectPassword)){
    foreach($result as $row){
        $password_from_SQL = $row["password"];
    }
}
if($password_from_HTML == $password_from_SQL) $authorization = true;
if($authorization == true) echo "<p>"."Успешная авторизация"."</p>"."<p>"."Привет,$username"."</p>";
else echo "<p>"."Ошибка авторизации"."</p>"."<p>"."<a href='index.html'>На главную</a>"."</p>";
?>