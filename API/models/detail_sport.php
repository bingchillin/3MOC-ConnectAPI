<?php

require __DIR__ . "/../library/get-database-connection.php";

class sportDetail
{
    public static function getAll()
    {
        $connection = getDatabaseConnection();

        $getSportDetailQuery = $connection->query("SELECT plan_sport.name,plan_sport.description,detail_sport.exo_set,detail_sport.repetition,detail_sport.timer,exercise.name,exercise.description 
        FROM plan_sport LEFT JOIN (detail_sport LEFT JOIN exercise ON detail_sport.id_exercise = exercise.id) ON plan_sport.id = detail_sport.id_plan");

        $sportDetails = $getSportDetailQuery->fetchAll();

        return $sportDetails;
    }

    public static function create($sportDetail)
    {
        $connection = getDatabaseConnection();
        $createSportDetailQuery = $connection->prepare("INSERT INTO detail_sport(exo_set,id_exercise,id_plan,repetition,timer) VALUES(:exo_set,:id_exercise,:id_plan,:repetition,:timer);");
        $createSportDetailQuery->execute($sportDetail);
    }

    public static function getById($id)
    {
        $connection = getDatabaseConnection();
        $getIngredientDetailByIdQuery = $connection->prepare("SELECT * FROM detail_sport WHERE id = :id;");

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
        $getSportDetailByIdQuery = $connection->prepare("SELECT * FROM detail_sport WHERE id_plan = :id_plan AND id_exercice=:id_exercice;");

        $getSportDetailByIdQuery->execute(
          [
            "id_plan" => $json["id_plan"],
          "id_exercice" =>$json["id_exercice"]
        ]
        );

        $sportDetail = $getSportDetailByIdQuery->fetch();

        return $sportDetail;
    }

    public static function deleteById($sportDetail)
    {
        $connection = getDatabaseConnection();
        $deleteByIdQuery = $connection->prepare("DELETE FROM detail_sport WHERE id = :id;");
        $deleteByIdQuery->execute($sportDetail);
    }

    public static function updateById($json)
    {
        $allowedColumns = ["id_ingredient","quantity","weight","calories"];
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
