<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../library/request.php";
require __DIR__ . "/../../models/ingredient.php";

try {
    $json = Request::getJsonBody();
    if(!ingredientModel::getByName($json["name"])){
      ingredientModel::updateById($json);
      Response::json(200, [], ["success" => true]);
    }else{
      Response::json(201, [], [ "error" => "Ingredient deja existant" ]);
    }
} catch (PDOException $exception) {
    Response::json(500, [], ["success" => false, "error" => $exception->getMessage()]);
}
