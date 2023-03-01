<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/user-recettes.php";
require __DIR__ . "/../../library/request.php";

try {
    $json = Request::getJsonBody();
    $recettes = userRecipesModel::getAll($json);
    Response::json(200, [], [ "recettes" => $recettes ]);
} catch (PDOException $exception) {
    $errorMessage = $exception->getMessage();
    Response::json(500, [], [ "error" => "Error while accessing the database: $errorMessage" ]);
}
