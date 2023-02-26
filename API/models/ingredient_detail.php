<?php

require __DIR__ . "/../library/get-database-connection.php";

class ingredientDetail
{
    public static function getAll()
    {
        $connection = getDatabaseConnection();

        $getIngredientDetailQuery = $connection->query("SELECT * FROM ingredient_detail");

        $ingredientDetails = $getIngredientDetailQuery->fetchAll();

        return $ingredientDetails;
    }

    public static function create($ingredientDetail)
    {
        $connection = getDatabaseConnection();
        $createIngredientDetailQuery = $connection->prepare("INSERT INTO ingredient_detail(idIngredient,qte,masse) VALUES(:idIngredient,:qte,:masse);");
        $createIngredientDetailQuery->execute($ingredientDetail);
    }

    public static function getById($id)
    {
        $connection = getDatabaseConnection();
        $getIngredientDetailByIdQuery = $connection->prepare("SELECT * FROM ingredient_detail WHERE id = :id;");

        $getIngredientDetailByIdQuery->execute(
            [
            "id" => $id
            ]
        );

        $ingredientDetail = $getIngredientDetailByIdQuery->fetch();

        return $ingredientDetail;
    }

    public static function getByIdInd($id_ingr)
    {
        $connection = getDatabaseConnection();
        $getIngredientDetailByIdQuery = $connection->prepare("SELECT * FROM ingredient_detail WHERE id_ingredient = :id;");

        $getIngredientDetailByIdQuery->execute(
            [
            "id_ingredient" => $id_ingr
            ]
        );

        $ingredientDetail = $getIngredientDetailByIdQuery->fetch();

        return $ingredientDetail;
    }

    public static function deleteById($ingredientDetail)
    {
        $connection = getDatabaseConnection();
        $deleteByIdQuery = $connection->prepare("DELETE FROM ingredient_detail WHERE id = :id;");
        $deleteByIdQuery->execute($user);
    }

    public static function updateById($json)
    {
        $allowedColumns = ["id_ingredient","quantity","weight"];
        $columns = array_keys($json);
        $set = [];

        foreach ($columns as $column) {
            if (!in_array($column, $allowedColumns)) {
                continue;
            }

            $set[] = "$column = :$column";
        }

        $set = implode(", ", $set);
        $sql = "UPDATE ingredient_detail SET $set WHERE id = :id";
        $connection = getDatabaseConnection();
        $query = $connection->prepare($sql);
        $query->execute($json);
    }
}
