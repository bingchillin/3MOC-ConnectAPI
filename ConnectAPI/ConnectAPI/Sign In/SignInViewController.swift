//
//  SignInViewController.swift
//  ConnectAPI
//
//  Created by Mohamed El Fakharany on 21/01/2023.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var signInDescriptionLabel: UILabel!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var noAccountLabel: UILabel!
    @IBOutlet weak var connectionButton: UIButton!
    class func newInstance() -> SignInViewController {
        let signInViewController = SignInViewController()
        
        return signInViewController
    }

    override func viewDidLoad() {
        self.mailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        signInLabel.text = NSLocalizedString("controllers.signin.signin", comment: "")
        signInDescriptionLabel.text = NSLocalizedString("controllers.signin.signinDescription", comment: "")
        
        mailTextField.placeholder = NSLocalizedString("controllers.signin.mail", comment: "")
        passwordTextField.placeholder = NSLocalizedString("controllers.signin.password", comment: "")
        
        connectionButton.setTitle(NSLocalizedString("controllers.signin.signinButton", comment: ""), for: .normal)
        
        noAccountLabel.text = NSLocalizedString("controllers.signin.noaccount", comment: "")
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleConnect(_ sender: Any) {
        
        
        if (mailTextField.hasText && passwordTextField.hasText){
            
            let parameters: [String: Any] = ["email": mailTextField,"password": passwordTextField]
                UserWebService.loginUser(parameters: parameters)
            let tabBarController = UITabBarController()
            tabBarController.tabBar.backgroundColor = .white
            tabBarController.tabBar.tintColor = hexStringToUIColor(hex: "#a5ce63")
            
            
            let homepageViewController = HomepageViewController()
            homepageViewController.tabBarItem.title = NSLocalizedString("controllers.tabbar.homepage", comment: "")
            homepageViewController.tabBarItem.image = resizeImage(image: UIImage(named: "homepage")!, targetSize: CGSizeMake(27.0, 27.0))
            
            let trainingViewController = TrainingViewController()
            trainingViewController.tabBarItem.title = NSLocalizedString("controllers.tabbar.training", comment: "")
            trainingViewController.tabBarItem.image = resizeImage(image: UIImage(named: "dumbbell")!, targetSize: CGSizeMake(27.0, 27.0))
            
            let nutritionViewController = NutritionViewController()
            nutritionViewController.tabBarItem.title = NSLocalizedString("controllers.tabbar.nutrition", comment: "")
            nutritionViewController.tabBarItem.image = resizeImage(image: UIImage(named: "nutrition")!, targetSize: CGSizeMake(27.0, 27.0))
            
            let favoritesViewController = FavoritesViewController()
            favoritesViewController.tabBarItem.title = NSLocalizedString("controllers.tabbar.favorites", comment: "")
            favoritesViewController.tabBarItem.image = resizeImage(image: UIImage(named: "favorites-star")!, targetSize: CGSizeMake(27.0, 27.0))
            
            tabBarController.viewControllers = [
                homepageViewController,
                trainingViewController,
                nutritionViewController,
                favoritesViewController
            ]
            
            self.navigationController?.pushViewController(tabBarController,animated: true)
        }
        
        else{
            print("MARCHE PAS")
        }
        /*
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = hexStringToUIColor(hex: "#a5ce63")
        
        
        let homepageViewController = HomepageViewController()
        homepageViewController.tabBarItem.title = NSLocalizedString("controllers.tabbar.homepage", comment: "")
        homepageViewController.tabBarItem.image = resizeImage(image: UIImage(named: "homepage")!, targetSize: CGSizeMake(27.0, 27.0))
        
        let trainingViewController = TrainingViewController()
        trainingViewController.tabBarItem.title = NSLocalizedString("controllers.tabbar.training", comment: "")
        trainingViewController.tabBarItem.image = resizeImage(image: UIImage(named: "dumbbell")!, targetSize: CGSizeMake(27.0, 27.0))
        
        let nutritionViewController = NutritionViewController()
        nutritionViewController.tabBarItem.title = NSLocalizedString("controllers.tabbar.nutrition", comment: "")
        nutritionViewController.tabBarItem.image = resizeImage(image: UIImage(named: "nutrition")!, targetSize: CGSizeMake(27.0, 27.0))
        
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.tabBarItem.title = NSLocalizedString("controllers.tabbar.favorites", comment: "")
        favoritesViewController.tabBarItem.image = resizeImage(image: UIImage(named: "favorites-star")!, targetSize: CGSizeMake(27.0, 27.0))
        
        tabBarController.viewControllers = [
            homepageViewController,
            trainingViewController,
            nutritionViewController,
            favoritesViewController
        ]
        
        self.navigationController?.pushViewController(tabBarController,animated: true)
         */
    }
    
    @objc func handleTapOnView(gesture: UITapGestureRecognizer) {
        self.mailTextField.resignFirstResponder()
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
