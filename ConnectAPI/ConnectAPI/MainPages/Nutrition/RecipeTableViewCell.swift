//
//  RecipeTableViewCell.swift
//  ConnectAPI
//
//  Created by kenny on 08/03/2023.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    
    @IBOutlet var recipeNameLabel: UILabel!
    @IBOutlet var recipeTimerLabel: UILabel!
    @IBOutlet var recipeDescriptionLabel: UILabel!
    
    func redraw(with recipe: Recipe){
        self.recipeNameLabel.text = recipe.name
        self.recipeTimerLabel.text = "\(recipe.timer)"
        self.recipeDescriptionLabel.text = recipe.description
    }
}
