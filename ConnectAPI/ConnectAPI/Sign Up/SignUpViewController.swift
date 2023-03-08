//
//  SignUpViewController.swift
//  ConnectAPI
//
//  Created by Mohamed El Fakharany on 21/01/2023.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var welcomeTitleLabel: UILabel!
    @IBOutlet weak var welcomeDescriptionLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var zipcodeTextfield: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var alreadyaccountLabel: UILabel!
    
    class func newInstance() -> SignUpViewController {
        let signUpViewContoller = SignUpViewController()
        
        return signUpViewContoller
    }
    
    
    
    @IBAction func signUp(_ sender: UIButton) {
        if (nameTextField.hasText && lastnameTextField.hasText && passwordTextField.hasText && emailTextField.hasText && addressTextField.hasText && zipcodeTextfield.hasText && cityTextField.hasText){
            
            let parameters = "{\n    \"name\" : \"\(lastnameTextField.text!)\",\n    \"firstname\" : \"\(nameTextField.text!)\",\n    \"address\" : \"\(addressTextField.text!)\",\n    \"city\" : \"\(cityTextField.text!)\",\n    \"cp\" : \"\(zipcodeTextfield.text!)\",\n    \"password\" : \"\(passwordTextField.text!)\",\n    \"email\" : \"\(emailTextField.text!)\"\n}"
                UserWebService.registerUser(parameters: parameters)
            
            let signIn = SignInViewController.newInstance()
            self.navigationController?.pushViewController(signIn, animated: true)
        }
        
        else{
            print("MARCHE PAS")
        }
    }
    
    override func viewDidLoad() {
        
        
        welcomeTitleLabel.text = NSLocalizedString("controllers.signup.welcome", comment: "")
        welcomeDescriptionLabel.text = NSLocalizedString("controllers.signup.welcomeDescription", comment: "")
        
        nameTextField.placeholder = NSLocalizedString("controllers.signup.name", comment: "")
        lastnameTextField.placeholder = NSLocalizedString("controllers.signup.lastname", comment: "")
        emailTextField.placeholder = NSLocalizedString("controllers.signup.mail", comment: "")
        addressTextField.placeholder = NSLocalizedString("controllers.signup.address", comment: "")
        cityTextField.placeholder = NSLocalizedString("controllers.signup.city", comment: "")
        zipcodeTextfield.placeholder = NSLocalizedString("controllers.signup.zipcode", comment: "")
        passwordTextField.placeholder = NSLocalizedString("controllers.signup.password", comment: "")
        
        signupButton.setTitle(NSLocalizedString("controllers.signup.signUpButton", comment: ""), for: .normal)
        alreadyaccountLabel.text = NSLocalizedString("controllers.signup.alreadyaccount", comment: "")
        
        super.viewDidLoad()
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.nameTextField.delegate = self
        self.lastnameTextField.delegate = self
        self.cityTextField.delegate = self
        self.addressTextField.delegate = self
        self.zipcodeTextfield.delegate = self
    }
    
    
    @objc func handleTapOnView(gesture: UITapGestureRecognizer) {
        self.emailTextField.resignFirstResponder()
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
            self.signupButton.isEnabled = true
        } else {
            self.signupButton.isEnabled = false
        }
        return true
    }

}
