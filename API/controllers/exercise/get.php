<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/ingredient.php";
require __DIR__ . "/../../library/request.php";

try {
    $ingredient = ingredientModel::getAll();
    Response::json(200, [], [ "ingredient" => $ingredient ]);
} catch (PDOException $exception) {
    $errorMessage = $exception->getMessage();
    Response::json(500, [], [ "error" => "Error while accessing the database: $errorMessage" ]);
}
