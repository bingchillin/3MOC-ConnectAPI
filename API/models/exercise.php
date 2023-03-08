<?php

require __DIR__ . "/../library/get-database-connection.php";

class exerciceModel
{
    public static function getAll()
    {
        $connection = getDatabaseConnection();

        $getExerciseQuery = $connection->query("SELECT * FROM exercise");

        $exercise = $getExerciseQuery->fetchAll();

        return $exercise;
    }

    public static function create($exercise)
    {

        $connection = getDatabaseConnection();
        $createIngredientQuery = $connection->prepare("INSERT INTO exercise(name,calorie) VALUES(:name,:calorie);");
        $createIngredientQuery->execute($exercise);
    }

    public static function getById($id)
    {
        $connection = getDatabaseConnection();
        $getIngredientQuery = $connection->prepare("SELECT * FROM exercise WHERE id = :id;");

        $getIngredientQuery->execute(
            [
            "id" => $id
            ]
        );

        $exercise = $getIngredientQuery->fetch();

        return $exercise;
    }

    public static function getByName($name)
    {
        $connection = getDatabaseConnection();
        $getIngredientQuery = $connection->prepare("SELECT * FROM exercise WHERE name = :name;");

        $getIngredientQuery->execute(
            [
            "name" => $name
            ]
        );

        $exercise = $getIngredientQuery->fetch();

        return $exercise;
    }

    public static function deleteById($exercise)
    {
        $connection = getDatabaseConnection();
        $deleteByIdQuery = $connection->prepare("DELETE FROM exercise WHERE id = :id;");
        $deleteByIdQuery->execute($exercise);

        $deleteIngDet = $connection->prepare("DELETE FROM detail_plan WHERE id_exercise = :id;");
        $deleteIngDet->execute($exercise);
    }

    public static function updateById($json)
    {
        $allowedColumns = ["name","description"];
        $columns = array_keys($json);
        $set = [];

        foreach ($columns as $column) {
            if (!in_array($column, $allowedColumns)) {
                continue;
            }

            $set[] = "$column = :$column";
        }

        $set = implode(", ", $set);
        $sql = "UPDATE exercise SET $set WHERE id = :id";
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
