<?php
$SQLmydb = mysqli_connect("127.0.0.1", "rafinadik", "Password1","mydb",3306);
$now = date("Y-m-d H:i:s", time());
if (isset($_COOKIE["user_id"])) {
    $user_hash = $_COOKIE["user_id"];
    $ALLinfoUser = 
    "SELECT * 
    FROM 
    user u 
    INNER JOIN 
    session s 
    ON u.user_id = s.user_user_id 
    WHERE session_hash = '$user_hash'";
    if($result = $SQLmydb->query($ALLinfoUser)){
        foreach($result as $row){
            $username = $row["username"];
            $name = $row["name"];
            $surname = $row["surname"];
            $email = $row["email"];
            $expires_at = $row["expires_at"];
        }
    if($expires_at < $now){
        echo "<p>"."Сессия закрыта"."</p>"."<p>"."<a href='index.php'>На главную</a>"."</p>";
        sleep(10);
        header("Location: index.php");
        setcookie("user_id", "",time()-1);
        exit;
    }
    else{
        echo 
    "<p>"."username: $username"."<p>".
    "<p>"."name: $name"."<p>".
    "<p>"."surname: $surname"."<p>".
    "<p>"."email: $email"."<p>";
    }
}
}
else{
    echo "<p>"."Cookie не найден"."</p>"."<p>"."<a href='index.php'>На главную</a>"."</p>";
    sleep(10);
    header("Location: index.php");
    exit;
} 
