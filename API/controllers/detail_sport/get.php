<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/ingredient_detail.php";
require __DIR__ . "/../../library/request.php";

try {
    $json = Request::getJsonBody();
    $sportDetail = sportDetail::getAll($json);
    Response::json(200, [], [ "liste ingredient" => $sportDetail ]);
} catch (PDOException $exception) {
    $errorMessage = $exception->getMessage();
    Response::json(500, [], [ "error" => "Error while accessing the database: $errorMessage" ]);
}
