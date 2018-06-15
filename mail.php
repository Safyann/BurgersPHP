<?php
require_once 'config.php';

parse_str($_POST['input'], $input);

$users = $pdo->prepare("INSERT INTO users(name, email, phone) VALUES(:name, :email, :phone)");
$users->execute(array(
    "name" => $input["name"],
    "email" => $input["email"],
    "phone" => $input["phone"]
));
$id_user = selectIDfromName($pdo, $input["email"]);
$ordering = $pdo->prepare("INSERT INTO order(user_id, street, home, part, appt, floor, comment, payment, callback) 
              VALUES(:user_id, :street, :home, :part, :appt, :floor, :comment, :payment, :callback)");
$ordering->execute(array(
    "user_id" => $id_user,
    "street" => $input["street"],
    "home" => $input["home"],
    "part" => $input["part"],
    "appt" => $input["appt"],
    "floor" => $input["floor"],
    "comment" => $input["comment"],
    "payment" => ($input["payment"] == 'on') ? true : false,
    "callback" => ($input["callback"] == 'on') ? true : false
));
$id = $pdo->lastInsertId();
$countOrdering = orderNew($pdo, $input["email"]);
if ($countOrdering > 1) {
    $firstOrderdering = "Спасибо - это ваш первый заказ";
} else {
    $firstOrderdering = "Спасибо! Это уже $countOrdering заказ";
}
$email = "qwelp@mail.ru";
$subject = "Заказ $id";
$msg = "Ваш заказ будет доставлен по адресу
Улица {$input["street"]}, Дом {$input["home"]}, Корпус {$input["part"]},Квартира {$input["appt"]}, Этаж {$input["floor"]}
DarkBeefBurger за 500 рублей, 1 шт
$firstOrderdering";
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= "Content-type: text/html; charset=utf-8 \r\n";
mail($email, $subject, $msg, $headers);