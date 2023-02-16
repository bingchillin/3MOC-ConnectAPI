//
//  HomeViewController.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 11/01/2023.
//

import UIKit

class HomeViewController: UIViewController {


    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBAction func toSignIn(_ sender: Any) {
        let signIn = SignInViewController.newInstance()
        self.navigationController?.pushViewController(signIn, animated: true)
    }
    @IBAction func toSignUp(_ sender: Any) {
        let signUp = SignUpViewController.newInstance()
        self.navigationController?.pushViewController(signUp, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SignUpButton.setTitle(NSLocalizedString("controllers.home.signup", comment: ""), for: .normal)
        SignInButton.setTitle(NSLocalizedString("controllers.home.signin", comment: ""), for: .normal)

    }
}
