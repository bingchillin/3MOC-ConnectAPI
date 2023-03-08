<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/plan_sport.php";
require __DIR__ . "/../../library/request.php";

try {

    $plans = planSportModel::getAll();
    Response::json(200, [], [ "programmes" => $plans ]);
} catch (PDOException $exception) {
    $errorMessage = $exception->getMessage();
    Response::json(500, [], [ "error" => "Error while accessing the database: $errorMessage" ]);
}
