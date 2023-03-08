//
//  TrainingViewController.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 09/02/2023.
//

import UIKit

class TrainingViewController: UIViewController {

    @IBOutlet weak var todayLbl: UILabel!
    @IBOutlet weak var programLbl: UILabel!
    @IBOutlet weak var allProgramlbl: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var photoTableView: UITableView!
    @IBOutlet weak var iconBackgroundView: UIView!
    
    class func newInstance() -> TrainingViewController {
        let trainingViewController = TrainingViewController()
        
        return trainingViewController
    }

    @IBAction func handleLogout(_ sender: UIButton) {
        if (UserDefaults.standard.string(forKey: "uId") != nil){
            let parameter = "{\n    \"id\" : \"\(UserDefaults.standard.string(forKey: "uId")!)\"\n}"
            UserWebService.logoutUser(parameters: parameter)
            self.navigationController?.pushViewController(HomeViewController(), animated: true)
            
        }
        
        else{
            print("MARCHE PAS")
        }
        
    }
    override func viewDidLoad() {
        todayLbl.text = NSLocalizedString("topbar.today", comment: "")
        programLbl.text = NSLocalizedString("controllers.mainpages.training.program", comment: "")
        allProgramlbl.text = NSLocalizedString("controllers.mainpages.training.allprogram", comment: "")
        logoutBtn.setTitle(NSLocalizedString("topbar.logout", comment: ""), for: .normal)
        self.navigationController?.navigationBar.removeFromSuperview()
        
        super.viewDidLoad()

    }
}
