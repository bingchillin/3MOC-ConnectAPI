<?php

require __DIR__ . "/../library/get-database-connection.php";

class UserModel
{
    public static function getAll()
    {
        $connection = getDatabaseConnection();

        $getUsersQuery = $connection->query("SELECT * FROM users");

        $users = $getUsersQuery->fetchAll();

        return $users;
    }

    public static function getById($id)
    {
        $connection = getDatabaseConnection();
        $getUserByIdQuery = $connection->prepare("SELECT * FROM users WHERE id = :id;");

        $getUserByIdQuery->execute(
            [
            "id" => $id
            ]
        );

        $user = $getUserByIdQuery->fetch();

        return $user;
    }

    public static function getByEmail($email)
    {
        $connection = getDatabaseConnection();
        $getUserByIdQuery = $connection->prepare("SELECT * FROM users WHERE email = :email;");
        $getUserByIdQuery->execute(["email" => $email]);

        return $getUserByIdQuery->fetch();
    }

    public static function create($user)
    {
        /*$userExiste = getByEmail($user["email"]);

        if($userExiste){
          Response::json(404, [], ["success" => false, "error" => "User existe"]);
          die;
        }*/

        $connection = getDatabaseConnection();
        $createUserQuery = $connection->prepare("INSERT INTO users(firstname,name,address,city,cp,email,height,password,weight) VALUES(:firstname,:name,:address,:city,:cp,:email,:height,:password,:weight);");
        $createUserQuery->execute($user);
    }

    public static function getByToken($token)
    {
        $connection = getDatabaseConnection();
        $getUserByIdQuery = $connection->prepare("SELECT * FROM users WHERE token = :token;");
        $getUserByIdQuery->execute(["token" => $token]);

        return $getUserByIdQuery->fetch();
    }

    public static function deleteById($user)
    {
        $connection = getDatabaseConnection();
        $deleteByIdQuery = $connection->prepare("DELETE FROM users WHERE id = :id;");
        $deleteByIdQuery->execute($user);
    }

    public static function updateById($json)
    {
        $allowedColumns = ["name", "firstname", "email", "address", "token", "password", "calorie", "city", "cp", "height", "weight"];
        $columns = array_keys($json);
        $set = [];

        foreach ($columns as $column) {
            if (!in_array($column, $allowedColumns)) {
                continue;
            }

            $set[] = "$column = :$column";
        }

        $set = implode(", ", $set);
        $sql = "UPDATE users SET $set WHERE id = :id";
        $connection = getDatabaseConnection();
        $query = $connection->prepare($sql);
        $query->execute($json);
    }
}
