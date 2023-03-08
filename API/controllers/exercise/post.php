<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/ingredient.php";
require __DIR__ . "/../../library/request.php";

try {
    $json = Request::getJsonBody();
    if(!ingredientModel::getByName($json["name"])){
      ingredientModel::create($json);
      Response::json(201, [], [ "success" => true ]);
    }else{
      Response::json(201, [], [ "error" => "Ingredient deja existant" ]);
    }
} catch (PDOException $exception) {
    $errorMessage = $exception->getMessage();
    Response::json(500, [], [ "error" => "Error while accessing the database: $errorMessage" ]);
}
