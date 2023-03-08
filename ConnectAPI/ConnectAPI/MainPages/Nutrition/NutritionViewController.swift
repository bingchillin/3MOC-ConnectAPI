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
    @IBOutlet weak var allrecipeLbl: UILabel!
    @IBAction func toCreateRecipe(_ sender: Any) {
        self.navigationController?.pushViewController(CreateRecipeViewController(), animated: true)
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
