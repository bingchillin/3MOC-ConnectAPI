<?php

require __DIR__ . "/../../library/json-response.php";
require __DIR__ . "/../../models/detail_sport.php";
require __DIR__ . "/../../library/request.php";

try {
    $json = Request::getJsonBody();
    $detail = sportDetail::getById($json["id"]);

    if (!$detail_sport) {
        Response::json(404, [], ["success" => false, "error" => "exercise non trouvés"]);
        die();
    }

    sportDetail::deleteById($json);
    Response::json(200, [], ["success" => true]);
} catch (PDOException $exception) {
    Response::json(500, [], ["success" => false, "error" => $exception->getMessage()]);
}
