<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/favories.php";
require __DIR__ . "/../../library/request.php";

try {
    $json = Request::getJsonBody();
    $favorie = favoriesModel::getByDoubleId($json);

    if (!$favorie) {
        Response::json(404, [], ["success" => false, "error" => "favorie non trouvé"]);
        die();
    }

    favoriesModel::deleteById($json);
    Response::json(200, [], ["success" => true]);
} catch (PDOException $exception) {
    Response::json(500, [], ["success" => false, "error" => $exception->getMessage()]);
}
