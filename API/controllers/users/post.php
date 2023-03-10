<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/users.php";
require __DIR__ . "/../../library/request.php";

try {
    $json = Request::getJsonBody();
    if(!UserModel::getByEmail($json["email"])){
      UserModel::create($json);
      Response::json(201, [], [ "success" => true ]);
    }else{
      Response::json(500, [], [ "error" => "Compte deja existant" ]);
    }
} catch (PDOException $exception) {
    $errorMessage = $exception->getMessage();
    Response::json(500, [], [ "error" => "Error while accessing the database: $errorMessage" ]);
}
