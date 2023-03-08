//
//  HomepageViewController.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 09/02/2023.
//

import UIKit

class HomepageViewController: UIViewController {
    
    @IBOutlet weak var recipeLbl: UILabel!
    @IBOutlet weak var programLbl: UILabel!
    @IBOutlet weak var suggestLbl: UILabel!
    @IBOutlet weak var todayLbl: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    class func newInstance() -> HomepageViewController {
        let homepageViewController = HomepageViewController()
        
        return homepageViewController
    }

    @IBAction func handleLogout(_ sender: UIButton) {
        
            if (UserDefaults.standard.string(forKey: "uId") != nil){
                let parameter = "{\n    \"id\" : \(UserDefaults.standard.string(forKey: "uId")!)\n"
                UserWebService.logoutUser(parameters: parameter)
                self.navigationController?.pushViewController(HomeViewController(), animated: true)
                
            }
            
            else{
                print("MARCHE PAS")
            }
            
    }
    override func viewDidLoad() {
        
        todayLbl.text = NSLocalizedString("topbar.today", comment: "")
        suggestLbl.text = NSLocalizedString("controllers.mainpages.homepage", comment: "")
        programLbl.text = NSLocalizedString("controllers.mainpages.training.program", comment: "")
        recipeLbl.text = NSLocalizedString("controllers.mainpages.nutrition.recipelabel", comment: "")
        logoutBtn.setTitle(NSLocalizedString("topbar.logout", comment: ""), for: .normal)
        super.viewDidLoad()
        /*
        if let tabBarItemHome = self.tabBarController?.tabBar.items?[0] {
            tabBarItemHome.title = NSLocalizedString("controllers.tabbar.homepage", comment: "")
            tabBarItemHome.image = UIImage(systemName: "m.square.fill")
            tabBarItemHome.selectedImage = UIImage(systemName: "m.square")
            
        }
         */
    }
    
    
    

}
