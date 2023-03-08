<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../library/plan_sport.php";
require __DIR__ . "/../../models/users.php";

try {
    $json = Request::getJsonBody();
    if(!planSportModel::verifUserId($json)){
      planSportModel::updateById($json);
      Response::json(200, [], ["success" => true]);
    }else{
      Response::json(200, [], ["error" => "Programme deja present"]);
    }
} catch (PDOException $exception) {
    Response::json(500, [], ["success" => false, "error" => $exception->getMessage()]);
}
