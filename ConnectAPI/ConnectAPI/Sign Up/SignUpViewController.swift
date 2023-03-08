//
//  SignUpViewController.swift
//  ConnectAPI
//
//  Created by Mohamed El Fakharany on 21/01/2023.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
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
            
                let parameters: [String: Any] = ["firstname": nameTextField.text, "name": lastnameTextField.text, "address": addressTextField.text, "city": cityTextField.text, "cp": zipcodeTextfield.text, "email":emailTextField.text, "password":passwordTextField.text]
                UserWebService.registerUser(parameters: parameters)
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

        // Do any additional setup after loading the view.
    }

}
