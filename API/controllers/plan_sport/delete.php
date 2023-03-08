<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/plan_sport.php";
require __DIR__ . "/../../library/request.php";

try {
    $json = Request::getJsonBody();
    $plan = planSportModel::verifUserId($json);

    if (!$plan) {
        Response::json(404, [], ["success" => false, "error" => "User not found"]);
        die();
    }

    planSportModel::deleteById($json);
    Response::json(200, [], ["success" => true]);
} catch (PDOException $exception) {
    Response::json(500, [], ["success" => false, "error" => $exception->getMessage()]);
}
