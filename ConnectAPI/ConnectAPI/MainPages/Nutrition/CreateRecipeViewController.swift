//
//  CreateRecipeViewController.swift
//  ConnectAPI
//
//  Created by Mohamed El Fakharany on 08/03/2023.
//

import UIKit

class CreateRecipeViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var creationLbl: UILabel!
    @IBOutlet weak var timerTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    
    @IBAction func toIngredients(_ sender: UIButton) {
        
        if (nameTextField.hasText && timerTextField.hasText && descriptionTextField.hasText){
            let parameters = "{\n    \"name\" : \"\(nameTextField.text!)\",\n    \"timer\" : \"\(timerTextField.text!)\",\n    \"description\" : \"\(descriptionTextField.text!)\"\n}"
                RecipeWebService.loginUser(parameters: parameters)
            
            tabNextViews()
        }
        
        else{
            print("MARCHE PAS")
        }
        
        
        
        self.navigationController?.pushViewController(IngredientsViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        
        self.nameTextField.delegate = self
        self.timerTextField.delegate = self
        self.descriptionTextField.delegate = self
        
        signInLabel.text = NSLocalizedString("controllers.signin.signin", comment: "")
        signInDescriptionLabel.text = NSLocalizedString("controllers.signin.signinDescription", comment: "")
        
        mailTextField.placeholder = NSLocalizedString("controllers.signin.mail", comment: "")
        passwordTextField.placeholder = NSLocalizedString("controllers.signin.password", comment: "")
        
        connectionButton.setTitle(NSLocalizedString("controllers.signin.signinButton", comment: ""), for: .normal)
        
        noAccountLabel.text = NSLocalizedString("controllers.signin.noaccount", comment: "")
        
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
            self.connectionButton.isEnabled = true
        } else {
            self.connectionButton.isEnabled = false
        }
        return true
    }

}
