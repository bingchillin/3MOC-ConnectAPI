<?php

ini_set("display_errors", 1);
error_reporting(E_ALL);

$route = $_REQUEST["route"] ?? "undefined";

$method = $_SERVER["REQUEST_METHOD"];

if ($route === "login" && $method === "POST") {
    include __DIR__ . "/controllers/login/post.php";
    die();
}

if ($route === "logout" && $method === "DELETE") {
    include __DIR__ . "/controllers/logout/delete.php";
    die();
}

//ALL CONTROLLERS HERE
//Controller User
if ($route === "users") {
    if ($method === "GET") {
        include __DIR__ . "/controllers/users/get.php";
        die();
    }
    if ($method === "POST") {
        include __DIR__ . "/controllers/users/post.php";
        die();
    }
    if ($method === "PATCH") {
        include __DIR__ . "/controllers/users/patch.php";
        die();
    }
    if ($method === "DELETE") {
        include __DIR__ . "/controllers/users/delete.php";
        die();
    }
}

//Controller recettes
if ($route === "recettes") {
    if ($method === "GET") {
        include __DIR__ . "/controllers/recettes/get.php";
        die();
    }
    if ($method === "POST") {
        include __DIR__ . "/controllers/recettes/post.php";
        die();
    }
    if ($method === "PATCH") {
        include __DIR__ . "/controllers/recettes/patch.php";
        die();
    }
    if ($method === "DELETE") {
        include __DIR__ . "/controllers/recettes/delete.php";
        die();
    }
}

//Controller ingredient_detail
if ($route === "ingredient_detail") {
    if ($method === "GET") {
        include __DIR__ . "/controllers/ingredient_detail/get.php";
        die();
    }
    if ($method === "POST") {
        include __DIR__ . "/controllers/ingredient_detail/post.php";
        die();
    }
    if ($method === "PATCH") {
        include __DIR__ . "/controllers/ingredient_detail/patch.php";
        die();
    }
    if ($method === "DELETE") {
        include __DIR__ . "/controllers/ingredient_detail/delete.php";
        die();
    }
}

//Controller ingredient
if ($route === "ingredient") {
    if ($method === "GET") {
        include __DIR__ . "/controllers/ingredient/get.php";
        die();
    }
    if ($method === "POST") {
        include __DIR__ . "/controllers/ingredient/post.php";
        die();
    }
    if ($method === "PATCH") {
        include __DIR__ . "/controllers/ingredient/patch.php";
        die();
    }
    if ($method === "DELETE") {
        include __DIR__ . "/controllers/ingredient/delete.php";
        die();
    }
}

if ($route === "user_recipes") {
    if ($method === "GET") {
        include __DIR__ . "/controllers/user_recipes/get.php";
        die();
    }
}

//Controller favories
if ($route === "favories") {
    if ($method === "GET") {
        include __DIR__ . "/controllers/favories/get.php";
        die();
    }
    if ($method === "POST") {
        include __DIR__ . "/controllers/favories/post.php";
        die();
    }
    if ($method === "PATCH") {
        include __DIR__ . "/controllers/favories/patch.php";
        die();
    }
    if ($method === "DELETE") {
        include __DIR__ . "/controllers/favories/delete.php";
        die();
    }
}

//Controller plan_sport
if ($route === "plan_sport") {
    if ($method === "GET") {
        include __DIR__ . "/controllers/plan_sport/get.php";
        die();
    }
    if ($method === "POST") {
        include __DIR__ . "/controllers/plan_sport/post.php";
        die();
    }
    if ($method === "PATCH") {
        include __DIR__ . "/controllers/plan_sport/patch.php";
        die();
    }
    if ($method === "DELETE") {
        include __DIR__ . "/controllers/plan_sport/delete.php";
        die();
    }
}

//Controller detail_sport
if ($route === "detail_sport") {
    if ($method === "GET") {
        include __DIR__ . "/controllers/detail_sport/get.php";
        die();
    }
    if ($method === "POST") {
        include __DIR__ . "/controllers/detail_sport/post.php";
        die();
    }
    if ($method === "PATCH") {
        include __DIR__ . "/controllers/detail_sport/patch.php";
        die();
    }
    if ($method === "DELETE") {
        include __DIR__ . "/controllers/detail_sport/delete.php";
        die();
    }
}

//Controller exercise
if ($route === "exercise") {
    if ($method === "GET") {
        include __DIR__ . "/controllers/exercise/get.php";
        die();
    }
    if ($method === "POST") {
        include __DIR__ . "/controllers/exercise/post.php";
        die();
    }
    if ($method === "PATCH") {
        include __DIR__ . "/controllers/exercise/patch.php";
        die();
    }
    if ($method === "DELETE") {
        include __DIR__ . "/controllers/exercise/delete.php";
        die();
    }
}

require __DIR__ . "/library/json-response.php";

Response::json(
    404, [], [
    "error" => "Route not found"
    ]
);
