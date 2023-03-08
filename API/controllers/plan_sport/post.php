<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/plan_sport.php";
require __DIR__ . "/../../library/request.php";

try {
    $json = Request::getJsonBody();
    if(!planSportModel::verifUserId($json)){
      planSportModel::create($json);
      Response::json(201, [], [ "success" => true ]);
    }else{
      Response::json(500, [], [ "error" => "Compte deja existant" ]);
    }
} catch (PDOException $exception) {
    $errorMessage = $exception->getMessage();
    Response::json(500, [], [ "error" => "Error while accessing the database: $errorMessage" ]);
}
