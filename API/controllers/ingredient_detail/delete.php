<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/ingredient_detail.php";
require __DIR__ . "/../../library/request.php";

try {
    $json = Request::getJsonBody();
    $recette = ingredientDetail::getById($json["id"]);

    if (!$recette) {
        Response::json(404, [], ["success" => false, "error" => "User not found"]);
        die();
    }

    ingredientDetail::deleteById($json);
    Response::json(200, [], ["success" => true]);
} catch (PDOException $exception) {
    Response::json(500, [], ["success" => false, "error" => $exception->getMessage()]);
}
