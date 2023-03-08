<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/detail_sport.php";
require __DIR__ . "/../../library/request.php";

try {
    $json = Request::getJsonBody();
    $sportDetail = sportDetail::getAll($json);
    Response::json(200, [], [ "exercises" => $sportDetail ]);
} catch (PDOException $exception) {
    $errorMessage = $exception->getMessage();
    Response::json(500, [], [ "error" => "Error while accessing the database: $errorMessage" ]);
}
