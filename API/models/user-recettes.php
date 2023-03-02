<?php

require __DIR__ . "/../library/get-database-connection.php";
class userRecipesModel
{
  public static function getAll($json)
  {
      $connection = getDatabaseConnection();

      $getUsersQuery = $connection->prepare("SELECT users.id, recipes.name AS name_recipe, recipes.timer, recipes.description, ingredient_detail.quantity, ingredient_detail.weight, ingredient.name
FROM ingredient RIGHT JOIN ((users LEFT JOIN recipes ON users.id = recipes.id_user) LEFT JOIN ingredient_detail ON recipes.id = ingredient_detail.id_recipe) ON ingredient.id = ingredient_detail.id_ingredient
WHERE (((users.id)=:id));");
      $getUsersQuery->execute($json);

      $recettes = $getUsersQuery->fetchAll();

      return $recettes;
  }
}
