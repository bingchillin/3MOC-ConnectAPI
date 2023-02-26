<?php

require __DIR__ . "/../library/get-database-connection.php";
class userRecipesModel
{
  public static function getAll($user)
  {
      $connection = getDatabaseConnection();

      $getUsersQuery = $connection->query("SELECT * FROM recipes WHERE id_user=:id");
      $recettes = $getUsersQuery->execute(["id" => $user["id"]]);

      return $recettes->fetchAll();
  }
}
