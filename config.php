<?php
$dsn = "mysql:host=localhost;dbname=burgers;charset=utf8";
$pdo = new PDO($dsn, 'root', '');

function orderNew($pdo, $email)
{
    $prepare = $pdo->prepare("SELECT * FROM users");
    $prepare->execute([
        'email' => $email
    ]);
    return $prepare->rowCount();
}
function selectAll($pdo, $tb)
{
    $prepare = $pdo->prepare("SELECT * FROM $tb");
    $prepare->execute();
    $data = $prepare->fetchAll(PDO::FETCH_ASSOC);
    return $data;
}
function selectIDfromName($pdo, $email)
{
    $prepare = $pdo->prepare('SELECT * FROM users where email = :email');
    $prepare->execute([
        'email' => $email
    ]);
    $data = $prepare->fetch(PDO::FETCH_ASSOC);
    return $data['id'];
}