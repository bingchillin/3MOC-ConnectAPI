<?php

require __DIR__ . "/../library/get-database-connection.php";

class favoriesModel
{
    public static function getAll($json)
    {
        $connection = getDatabaseConnection();

        $getFavoriesQuery = $connection->query("SELECT * FROM favories WHERE id_user=:id");
        $getFavoriesQuery->execute($json);
        $favories = $getFavoriesQuery->fetchAll();

        return $favories;
    }

    public static function create($favories)
    {
        $connection = getDatabaseConnection();
        $createIngredientQuery = $connection->prepare("INSERT INTO favories(id_user,id_recipe) VALUES(:id_user,:id_recipe);");
        $createIngredientQuery->execute($favories);
    }

    public static function getByDoubleId($json)
    {
        $connection = getDatabaseConnection();
        $getIngredientQuery = $connection->prepare("SELECT * FROM favories WHERE id_user=:id_user AND id_recipe=:id_recipe;");

        $getIngredientQuery->execute($json);

        $ingredient = $getIngredientQuery->fetch();

        return $ingredient;
    }

    public static function deleteById($favories)
    {
        $connection = getDatabaseConnection();
        $deleteByIdQuery = $connection->prepare("DELETE FROM favories WHERE id_user=:id_user AND id_recipe=:id_recipe;");
        $deleteByIdQuery->execute($favories);
    }

    public static function updateById($json)
    {
        $allowedColumns = ["id_user","id_recipe"];
        $columns = array_keys($json);
        $set = [];

        foreach ($columns as $column) {
            if (!in_array($column, $allowedColumns)) {
                continue;
            }

            $set[] = "$column = :$column";
        }

        $set = implode(", ", $set);
        $sql = "UPDATE favories SET $set WHERE id_user=:id_user AND id_recipe=:id_recipe;";
        $connection = getDatabaseConnection();
        $query = $connection->prepare($sql);
        $query->execute($json);
    }
}
