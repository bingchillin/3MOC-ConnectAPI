//
//  IngredientsViewController.swift
//  ConnectAPI
//
//  Created by Mohamed El Fakharany on 08/03/2023.
//

import UIKit

class IngredientsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var todayLbl: UILabel!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addIngredientsLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.quantityTextField.delegate = self
        self.weightTextField.delegate = self
        
        todayLbl.text = NSLocalizedString("topbar.today", comment: "")
        nameTextField.placeholder = NSLocalizedString("controllers.mainpages.nutrition.ingredientdetail.name", comment: "")
        quantityTextField.placeholder = NSLocalizedString("controllers.mainpages.nutrition.ingredientdetail.quantity", comment: "")
        weightTextField.placeholder = NSLocalizedString("controllers.mainpages.ingredientdetail.weight", comment: "")
        
        createBtn.setTitle(NSLocalizedString("controllers.mainpages.nutrition.ingredientdetail.createbutton", comment: ""), for: .normal)
        
        addIngredientsLbl.text = NSLocalizedString("controllers.mainpages.nutrition.ingredientdetail.createlabel", comment: "")
        
        super.viewDidLoad()
        
    }


}
