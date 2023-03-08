<?php

require __DIR__ . "/../library/get-database-connection.php";

class planSportModel
{
    public static function getAll()
    {
        $connection = getDatabaseConnection();

        $getPlansQuery = $connection->query("SELECT * FROM plan_sport");

        $plans = $getPlansQuery->fetchAll();

        return $plans;
    }

    public static function getByUserId($json)
    {
        $connection = getDatabaseConnection();
        $getByIdQuery = $connection->prepare("SELECT * FROM plan_sport WHERE id_user = :id_user;");

        $getByIdQuery->execute($json);

        $plan = $getByIdQuery->fetch();

        return $plan;
    }

    public static function verifUserId($json)
    {
        $connection = getDatabaseConnection();
        $getByIdQuery = $connection->prepare("SELECT * FROM plan_sport WHERE name = :name AND id_user = :id_user;");

        $getByIdQuery->execute($json);

        $plan = $getByIdQuery->fetch();

        return $plan;
    }

    public static function create($json)
    {

        $connection = getDatabaseConnection();
        $createPlanQuery = $connection->prepare("INSERT INTO plan_sport(name,categorie,id_user) VALUES(:name,:categorie,:id_user);");
        $createPlanQuery->execute($json);
    }

    public static function deleteById($json)
    {
        $connection = getDatabaseConnection();
        $deleteByIdQuery = $connection->prepare("DELETE FROM plan_sport WHERE id = :id;");
        $deleteByIdQuery->execute($json);

        $deleteDetailByIdQuery = $connection->prepare("DELETE FROM detail_sport WHERE id_plan = :id;");
        $deleteDetailByIdQuery->execute($json);

    }

    public static function updateById($json)
    {
        $allowedColumns = ["name", "categorie"];
        $columns = array_keys($json);
        $set = [];

        foreach ($columns as $column) {
            if (!in_array($column, $allowedColumns)) {
                continue;
            }

            $set[] = "$column = :$column";
        }

        $set = implode(", ", $set);
        $sql = "UPDATE plan_sport SET $set WHERE id = :id";
        $connection = getDatabaseConnection();
        $query = $connection->prepare($sql);
        $query->execute($json);
    }
}
