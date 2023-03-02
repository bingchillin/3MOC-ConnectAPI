<?php

require __DIR__ . "/../library/get-database-connection.php";

class ingredientDetail
{
    public static function getAll($json)
    {
        $connection = getDatabaseConnection();

        $getIngredientDetailQuery = $connection->prepare("SELECT recipes.name, recipes.timer, recipes.description, ingredient_detail.quantity, ingredient_detail.weight, ingredient.name, recipes.id
        FROM ingredient RIGHT JOIN ((users LEFT JOIN recipes ON users.id = recipes.id_user) LEFT JOIN ingredient_detail ON recipes.id = ingredient_detail.id_recipe) ON ingredient.id = ingredient_detail.id_ingredient
        WHERE (((recipes.id)=:id));");
        $getIngredientDetailQuery->execute($json);

        $ingredientDetails = $getIngredientDetailQuery->fetchAll();

        return $ingredientDetails;
    }

    public static function create($ingredientDetail)
    {
        $connection = getDatabaseConnection();
        $createIngredientDetailQuery = $connection->prepare("INSERT INTO ingredient_detail(id_recipe,id_ingredient,quantity,weight,calories) VALUES(:id_recipe,:id_ingredient,:quantity,:weight,:calories);");
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

    public static function getByIdAll($json)
    {
        $connection = getDatabaseConnection();
        $getIngredientDetailByIdQuery = $connection->prepare("SELECT * FROM ingredient_detail WHERE id_ingredient = :id_ingredient AND id_recipe=:id_recipe;");

        $getIngredientDetailByIdQuery->execute(
          [
            "id_ingredient" => $json["id_ingredient"],
          "id_recipe" =>$json["id_recipe"]
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
