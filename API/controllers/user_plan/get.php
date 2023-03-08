<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/user-plan.php";
require __DIR__ . "/../../library/request.php";

try {
    $json = Request::getJsonBody();
    $exercises = userSportModel::getAll($json);
    Response::json(200, [], [ "exercises" => $exercises ]);
} catch (PDOException $exception) {
    $errorMessage = $exception->getMessage();
    Response::json(500, [], [ "error" => "Error while accessing the database: $errorMessage" ]);
}
