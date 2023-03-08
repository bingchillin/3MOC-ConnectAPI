//
//  NutritionViewController.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 09/02/2023.
//

import UIKit

class NutritionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var recipeTableView: UITableView!
    var recipe: [Recipe]?
    
    @IBAction func toCreateRecipe(_ sender: Any) {
        self.navigationController?.pushViewController(CreateRecipeViewController(), animated: true)
    }
    
    class func newInstance() -> NutritionViewController {
        let nutritionViewController = NutritionViewController()
        
        return nutritionViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipeTableView.dataSource = self
        self.recipeTableView.delegate = self
        let recipeCellNib = UINib(nibName: "RecipeTableViewCell", bundle: nil) // nib correspond à un xib compilé
        self.recipeTableView.register(recipeCellNib, forCellReuseIdentifier: "RecipeCellId") // identifiant permettant de générer ce type de cellule
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        RecipeWebService.getAllRecipes { recipe,err in
            self.recipe = recipe
            DispatchQueue.main.sync {
                self.recipeTableView.reloadData() // permet de recharger la tableview
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipe?.count ?? 0 // ?? -> si la partie de gauche est nil retourne la partie de droite
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCellId", for: indexPath) as! RecipeTableViewCell
        cell.redraw(with: self.recipe![indexPath.row])
        return cell
    }
}
