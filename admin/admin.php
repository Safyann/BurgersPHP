<?php require ('../config.php');
$allUsers = selectAll($pdo, 'users');
$allOrdering = selectAll($pdo, 'order');
?>
<h2>Клиенты</h2>
<table border="1">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>email</th>
        <th>phone</th>
    </tr>
    <?foreach ($allUsers as $item):
        if(empty($item["name"])) continue;
        ?><tr>
        <td><?=$item["id"]?></td>
        <td><?=$item["name"]?></td>
        <td><?=$item["email"]?></td>
        <td><?=$item["phone"]?></td>
        </tr>
    <?endforeach;?>
</table>
<br>
<br>
<h2>Заказы</h2>
<table border="1">
    <tr>
        <th>id</th>
        <th>user_id</th>
        <th>street</th>
        <th>home</th>
        <th>part</th>
        <th>appt</th>
        <th>floor</th>
        <th>comment</th>
        <th>payment</th>
        <th>callback</th>
    </tr>
    <?foreach ($allOrdering as $item):
        if(empty($item["street"])) continue;
        ?><tr>
        <td><?=$item["id"]?></td>
        <td><?=$item["user_id"]?></td>
        <td><?=$item["street"]?></td>
        <td><?=$item["home"]?></td>
        <td><?=$item["part"]?></td>
        <td><?=$item["appt"]?></td>
        <td><?=$item["floor"]?></td>
        <td><?=$item["comment"]?></td>
        <td><?=$item["payment"]?></td>
        <td><?=$item["callback"]?></td>
        </tr>
    <?endforeach;?>
</table>