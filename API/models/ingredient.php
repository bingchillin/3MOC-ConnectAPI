<?php

require __DIR__ . "/../library/get-database-connection.php";

class ingredientModel
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
        $createIngredientQuery = $connection->prepare("INSERT INTO ingredient(name,calorie) VALUES(:name,:calorie);");
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
        $getIngredientQuery = $connection->prepare("SELECT * FROM ingredient WHERE name = :name;");

        $getIngredientQuery->execute(
            [
            "name" => $name
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

        $deleteIngDet = $connection->prepare("DELETE FROM ingredient_detail WHERE id_ingredient = :id;");
        $deleteIngDet->execute($ingredient);
    }

    public static function deleteByName($ingredient)
    {
        $connection = getDatabaseConnection();
        $deleteByNameQuery = $connection->prepare("DELETE FROM ingredient WHERE name = :name;");
        $deleteByNameQuery->execute($ingredient["name"]);
    }

    public static function updateById($json)
    {
        $allowedColumns = ["name","calorie"];
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
        $allowedColumns = ["name","calorie"];
        $columns = array_keys($json);
        $set = [];

        foreach ($columns as $column) {
            if (!in_array($column, $allowedColumns)) {
                continue;
            }

            $set[] = "$column = :$column";
        }

        $set = implode(", ", $set);
        $sql = "UPDATE ingredient SET $set WHERE name = :name";
        $connection = getDatabaseConnection();
        $query = $connection->prepare($sql);
        $query->execute($json["name"]);
    }
}
