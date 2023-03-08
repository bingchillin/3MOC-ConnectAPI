//
//  NutritionViewController.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 09/02/2023.
//

import UIKit

class NutritionViewController: UIViewController {
    
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
            let parameter = "{\n    \"id\" : \"\(UserDefaults.standard.string(forKey: "uId")!)\"\n"
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
        recipeLbl.text = NSLocalizedString("controllers.mainpages.nutrition.recipelabel", comment: "")


        super.viewDidLoad()

    }

}
