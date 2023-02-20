<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../library/request.php";
require __DIR__ . "/../../models/recettes.php";

try {
    $json = Request::getJsonBody();
    RecettesModel::updateById($json);
    Response::json(200, [], ["success" => true]);
} catch (PDOException $exception) {
    Response::json(500, [], ["success" => false, "error" => $exception->getMessage()]);
}
