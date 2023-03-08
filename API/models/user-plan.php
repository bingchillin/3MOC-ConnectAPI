<?php

require __DIR__ . "/../library/get-database-connection.php";

class userSportModel
{
    public static function getAll($json)
    {
        $connection = getDatabaseConnection();

        $getSportDetailQuery = $connection->prepare("SELECT plan_sport.name,plan_sport.description,detail_sport.exo_set,detail_sport.repetition,detail_sport.timer,exercise.name,exercise.description 
        FROM plan_sport LEFT JOIN (detail_sport LEFT JOIN exercise ON detail_sport.id_exercise = exercise.id) ON plan_sport.id = detail_sport.id_plan
        WHERE plan_sport.id_user=:id");
        $getSportDetailQuery->execute($json);

        $sportDetails = $getSportDetailQuery->fetchAll();

        return $sportDetails;
    }
}
