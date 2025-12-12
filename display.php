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
$SelectPassword = "SELECT user_id, password FROM user WHERE username='$username'AND password = '$password_from_HTML'";

if($result = $SQLmydb->query($SelectPassword)){
    foreach($result as $row){
        $password_from_SQL = $row["password"];
        $user_id = $row["user_id"];
    }
}
if($password_from_HTML == $password_from_SQL) $authorization = true;
else $authorization = false;
if($authorization == true) {
    $randomBytes = random_bytes(16);
    $hashUser = bin2hex($randomBytes);
    $now = time();
    $expired = $now+10;
    $expires_at = date("Y-m-d H:i:s", $expired);
    $SQLmydb->query("INSERT INTO session (user_user_id, session_hash,expires_at) VALUES ($user_id,'$hashUser','$expires_at')");
    setcookie("user_id", $hashUser);
    echo "<p>"."Успешная авторизация"."</p>"."<p>"."<a href='profile.php'>Профиль пользователя</a>"."</p>";
}
else echo "<p>"."Ошибка авторизации"."</p>"."<p>"."<a href='index.html'>На главную</a>"."</p>";

?>