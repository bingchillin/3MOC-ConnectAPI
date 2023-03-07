<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/favories.php";
require __DIR__ . "/../../library/request.php";

try {
    $favories = favoriesModel::getAll($json);
    Response::json(200, [], [ "favories" => $favories ]);
} catch (PDOException $exception) {
    $errorMessage = $exception->getMessage();
    Response::json(500, [], [ "error" => "Error while accessing the database: $errorMessage" ]);
}
