<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/ingredient.php";
require __DIR__ . "/../../library/request.php";

try {
    $json = Request::getJsonBody();
    $ingredient = ingredientModel::getById($json["id"]);

    if (!$ingredient) {
        Response::json(404, [], ["success" => false, "error" => "Ingredient non trouvé"]);
        die();
    }

    ingredientModel::deleteById($json);
    Response::json(200, [], ["success" => true]);
} catch (PDOException $exception) {
    Response::json(500, [], ["success" => false, "error" => $exception->getMessage()]);
}
