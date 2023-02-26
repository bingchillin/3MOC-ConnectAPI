<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/recettes.php";
require __DIR__ . "/../../library/request.php";

try {
    $json = Request::getJsonBody();

    if(!RecettesModel::getByName($json["name"])){
      RecettesModel::create($json);
      Response::json(201, [], [ "success" => true ]);
  }else{
    Response::json(500, [], [ "error" => "Recette deja existante" ]);
  }
} catch (PDOException $exception) {
    $errorMessage = $exception->getMessage();
    Response::json(500, [], [ "error" => "Error while accessing the database: $errorMessage" ]);
}
