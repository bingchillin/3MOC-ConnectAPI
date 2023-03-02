<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../library/request.php";
require __DIR__ . "/../../models/users.php";

try {
    $json = Request::getJsonBody();
    if(!UserModel::getByEmail($json["email"])){
      UserModel::updateById($json);
      Response::json(200, [], ["success" => true]);
    }else{
      Response::json(200, [], ["error" => "Email deja utilisé"]);
    }
} catch (PDOException $exception) {
    Response::json(500, [], ["success" => false, "error" => $exception->getMessage()]);
}
