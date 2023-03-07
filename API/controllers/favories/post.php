<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/favories.php";
require __DIR__ . "/../../library/request.php";

try {
    $json = Request::getJsonBody();
    if(!favoriesModel::existance($json["name"])){
      favoriesModel::create($json);
      Response::json(201, [], [ "success" => true ]);
    }else{
      Response::json(201, [], [ "error" => "favorie deja existant" ]);
    }
} catch (PDOException $exception) {
    $errorMessage = $exception->getMessage();
    Response::json(500, [], [ "error" => "Error while accessing the database: $errorMessage" ]);
}
