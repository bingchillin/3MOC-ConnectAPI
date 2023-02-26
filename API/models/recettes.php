<?php

require __DIR__ . "/../library/get-database-connection.php";

class RecettesModel
{
    public static function getAll()
    {
        $connection = getDatabaseConnection();

        $getRecettesQuery = $connection->query("SELECT * FROM recipes");

        $recettes = $getRecettesQuery->fetchAll();

        return $recettes;
    }

    public static function create($recette)
    {

        $connection = getDatabaseConnection();
        $createUserQuery = $connection->prepare("INSERT INTO recipes(name,timer,id_user,description) VALUES(:name,:timer,:id_user,:description);");
        $createUserQuery->execute($recette);
    }

    public static function getById($id)
    {
        $connection = getDatabaseConnection();
        $getRecetteByIdQuery = $connection->prepare("SELECT * FROM recipes WHERE id = :id;");

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
        $getRecetteByNameQuery = $connection->prepare("SELECT * FROM recipes WHERE name = :name;");

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
        $deleteByIdQuery = $connection->prepare("DELETE FROM recipes WHERE id = :id;");
        $deleteByIdQuery->execute($id);
    }

    public static function deleteByName($name)
    {
        $connection = getDatabaseConnection();
        $deleteByNameQuery = $connection->prepare("DELETE FROM recipes WHERE name = :name;");
        $deleteByNameQuery->execute($name);
    }

    public static function updateById($json)
    {
        $allowedColumns = ["name","timer","description"];
        $columns = array_keys($json);
        $set = [];

        foreach ($columns as $column) {
            if (!in_array($column, $allowedColumns)) {
                continue;
            }

            $set[] = "$column = :$column";
        }

        $set = implode(", ", $set);
        $sql = "UPDATE recipes SET $set WHERE id = :id";
        $connection = getDatabaseConnection();
        $query = $connection->prepare($sql);
        $query->execute($json);
    }
}
