//
//  CreateRecipeViewController.swift
//  ConnectAPI
//
//  Created by Mohamed El Fakharany on 08/03/2023.
//

import UIKit

class CreateRecipeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var creationLbl: UILabel!
    @IBOutlet weak var timerTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    
    @IBAction func toIngredients(_ sender: UIButton) {
        
        if (nameTextField.hasText && timerTextField.hasText && descriptionTextField.hasText){
            let parameters = "{\n    \"name\" : \"\(nameTextField.text!)\",\n    \"timer\" : \"\(timerTextField.text!)\",\n    \"description\" : \"\(descriptionTextField.text!)\"\n}"
            RecipeWebService.createRecipe(parameters: parameters)
            
            self.navigationController?.pushViewController(IngredientsViewController(), animated: true)
            
        }
        
        else{
            print("MARCHE PAS")
        }
        
    }
    
    override func viewDidLoad() {
        
        self.nameTextField.delegate = self
        self.timerTextField.delegate = self
        self.descriptionTextField.delegate = self
        
        nameTextField.placeholder = NSLocalizedString("controllers.mainpages.nutrition.createrecipe.name", comment: "")
        timerTextField.placeholder = NSLocalizedString("controllers.mainpages.nutrition.createrecipe.timer", comment: "")
        descriptionTextField.placeholder = NSLocalizedString("controllers.mainpages.nutrition.createrecipe.description", comment: "")
        
        createBtn.setTitle(NSLocalizedString("controllers.mainpages.nutrition.createrecipe.createbutton", comment: ""), for: .normal)
        
        creationLbl.text = NSLocalizedString("controllers.mainpages.nutrition.createrecipe.createlabel", comment: "")
        
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @objc func handleTapOnView(gesture: UITapGestureRecognizer) {
        self.nameTextField.resignFirstResponder()
        self.view.removeGestureRecognizer(gesture)
    }
    
    // Event déclenché lorsque le clavier est disponible pour le textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapOnView(gesture:)))
        self.view.addGestureRecognizer(tap)
    }
    
    // Event déclenché lorsque l'utilisateur clique sur le bouton retour
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // ferme le clavier
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("should change chars")
        guard let NSText = textField.text as? NSString else {
            return true
        }
        print("here")
        let realText = NSText.replacingCharacters(in: range, with: string)
        print(realText)
        if realText.count > 0 {
            self.createBtn.isEnabled = true
        } else {
            self.createBtn.isEnabled = false
        }
        return true
    }

}
