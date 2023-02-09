<?php

require __DIR__ . "/../library/get-database-connection.php";

class IngredientModel
{
    public static function getAll()
    {
        $connection = getDatabaseConnection();

        $getIngredientQuery = $connection->query("SELECT * FROM ingredient");

        $ingredient = $getIngredientQuery->fetchAll();

        return $ingredient;
    }

    public static function create($ingredient)
    {
        $connection = getDatabaseConnection();
        $createIngredientQuery = $connection->prepare("INSERT INTO ingredient(libelle,calories) VALUES(:libelle,:calories);");
        $createIngredientQuery->execute($ingredient);
    }

    public static function getById($id)
    {
        $connection = getDatabaseConnection();
        $getIngredientQuery = $connection->prepare("SELECT * FROM ingredient WHERE id = :id;");

        $getIngredientQuery->execute(
            [
            "id" => $id
            ]
        );

        $ingredient = $getIngredientQuery->fetch();

        return $ingredient;
    }

    public static function getByName($name)
    {
        $connection = getDatabaseConnection();
        $getIngredientQuery = $connection->prepare("SELECT * FROM ingredient WHERE libelle = :libelle;");

        $getIngredientQuery->execute(
            [
            "libelle" => $name
            ]
        );

        $ingredient = $getIngredientQuery->fetch();

        return $ingredient;
    }

    public static function deleteById($ingredient)
    {
        $connection = getDatabaseConnection();
        $deleteByIdQuery = $connection->prepare("DELETE FROM ingredient WHERE id = :id;");
        $deleteByIdQuery->execute($ingredient);
    }

    public static function deleteByName($ingredient)
    {
        $connection = getDatabaseConnection();
        $deleteByNameQuery = $connection->prepare("DELETE FROM ingredient WHERE libelle = :libelle;");
        $deleteByNameQuery->execute($ingredient);
    }

    public static function updateById($json)
    {
        $allowedColumns = ["Libelle","calories"];
        $columns = array_keys($json);
        $set = [];

        foreach ($columns as $column) {
            if (!in_array($column, $allowedColumns)) {
                continue;
            }

            $set[] = "$column = :$column";
        }

        $set = implode(", ", $set);
        $sql = "UPDATE ingredient SET $set WHERE id = :id";
        $connection = getDatabaseConnection();
        $query = $connection->prepare($sql);
        $query->execute($json);
    }

    public static function updateByName($json)
    {
        $allowedColumns = ["Libelle","calories"];
        $columns = array_keys($json);
        $set = [];

        foreach ($columns as $column) {
            if (!in_array($column, $allowedColumns)) {
                continue;
            }

            $set[] = "$column = :$column";
        }

        $set = implode(", ", $set);
        $sql = "UPDATE ingredient SET $set WHERE libelle = :libelle";
        $connection = getDatabaseConnection();
        $query = $connection->prepare($sql);
        $query->execute($json);
    }
}
