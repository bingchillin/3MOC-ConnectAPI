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
    
    @IBOutlet weak var todayLbl: UILabel!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var recipeLbl: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var allrecipeLbl: UILabel!
    @IBAction func toCreateRecipe(_ sender: Any) {
        self.navigationController?.pushViewController(CreateRecipeViewController(), animated: true)
    }
    
    @IBAction func handleLogout(_ sender: UIButton) {
        if (UserDefaults.standard.string(forKey: "uId") != nil){
            let parameter = "{\n    \"id\" : \"\(UserDefaults.standard.string(forKey: "uId")!)\"\n}"
            print(parameter)
            UserWebService.logoutUser(parameters: parameter)
            self.navigationController?.pushViewController(HomeViewController(), animated: true)
            
        }
        
        else{
            print("MARCHE PAS")
        }
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
            var recipes = [Recipe]()

            self.recipeLbl.text = NSLocalizedString("controllers.mainpages.nutrition.recipelabel", comment: "")


            if let recipeDictionaries = recipe as? [[String:Any]] {
                for recipeDictionary in recipeDictionaries {
                    if let id = recipeDictionary["id"] as? Int,
                       let name = recipeDictionary["name"] as? String,
                       let timer = recipeDictionary["timer"] as? Int,
                       let description = recipeDictionary["description"] as? String,
                       let userId = recipeDictionary["id_user"] as? Int {
                        let recipe = Recipe(id: id, id_user: userId, name: name, timer: timer, description: description)
                        recipes.append(recipe)
                    }
                }
            }

            self.recipe = recipes
            print(recipe)
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
