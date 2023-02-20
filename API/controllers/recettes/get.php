<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/recettes.php";
require __DIR__ . "/../../library/request.php";

try {

    $recettes = RecettesModel::getAll();
    Response::json(200, [], [ "recettes" => $recettes ]);

} catch (PDOException $exception) {
    $errorMessage = $exception->getMessage();
    Response::json(500, [], [ "error" => "Error while accessing the database: $errorMessage" ]);
}
