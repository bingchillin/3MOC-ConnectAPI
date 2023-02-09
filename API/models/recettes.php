<?php

require __DIR__ . "/../library/get-database-connection.php";

class RecettesModel
{
    public static function getAll()
    {
        $connection = getDatabaseConnection();

        $getRecettesQuery = $connection->query("SELECT * FROM recettes");

        $recettes = $getRecettesQuery->fetchAll();

        return $recettes;
    }

    public static function create($recette)
    {
        $connection = getDatabaseConnection();
        $createUserQuery = $connection->prepare("INSERT INTO recettes(Nom,Prenom,Pseudo,Mail,Mot_de_passe) VALUES(:Nom,:Prenom,:Pseudo,:Mail,:Mot_de_passe);");
        $createUserQuery->execute($user);
    }

    public static function getById($id)
    {
        $connection = getDatabaseConnection();
        $getRecetteByIdQuery = $connection->prepare("SELECT * FROM recettes WHERE id = :id;");

        $getRecetteByIdQuery->execute(
            [
            "id" => $id
            ]
        );

        $recettes = $getRecetteByIdQuery->fetch();

        return $recettes;
    }

    public static function getByName($name)
    {
        $connection = getDatabaseConnection();
        $getRecetteByNameQuery = $connection->prepare("SELECT * FROM recettes WHERE name = :name;");

        $getRecetteByNameQuery->execute(
            [
            "name" => $name
            ]
        );

        $recettes = $getRecetteByNameQuery->fetch();

        return $recettes;
    }

    public static function deleteById($id)
    {
        $connection = getDatabaseConnection();
        $deleteByIdQuery = $connection->prepare("DELETE FROM recettes WHERE id = :id;");
        $deleteByIdQuery->execute($id);
    }

    public static function deleteByName($name)
    {
        $connection = getDatabaseConnection();
        $deleteByNameQuery = $connection->prepare("DELETE FROM recettes WHERE name = :name;");
        $deleteByNameQuery->execute($name);
    }

    public static function updateById($json)
    {
        $allowedColumns = ["name","time","calories","description"];
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
