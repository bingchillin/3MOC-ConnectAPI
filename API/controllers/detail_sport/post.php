<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/detail_sport.php";
require __DIR__ . "/../../library/request.php";

try {
    $json = Request::getJsonBody();
    if(!sportDetail::getByIdAll($json)){
      sportDetail::create($json);
      Response::json(201, [], [ "success" => true ]);
    }else{
      Response::json(201, [], [ "error" => "Exercice deja existant" ]);
    }
} catch (PDOException $exception) {
    $errorMessage = $exception->getMessage();
    Response::json(500, [], [ "error" => "Error while accessing the database: $errorMessage" ]);
}
