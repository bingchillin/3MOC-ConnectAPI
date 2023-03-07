<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../library/request.php";
require __DIR__ . "/../../models/favories.php";

try {
  $json = Request::getJsonBody();
  $favorie = favoriesModel::getByDoubleId($json);

  if ($favorie) {
      favoriesModel::updateById($json);
      Response::json(200, [], ["success" => true]);
    }else{
      Response::json(201, [], [ "error" => "Favorie deja existant" ]);
    }
} catch (PDOException $exception) {
    Response::json(500, [], ["success" => false, "error" => $exception->getMessage()]);
}
