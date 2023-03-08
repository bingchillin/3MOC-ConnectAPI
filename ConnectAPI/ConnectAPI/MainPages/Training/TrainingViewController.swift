//
//  TrainingViewController.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 09/02/2023.
//

import UIKit

class TrainingViewController: UIViewController {

    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var photoTableView: UITableView!
    @IBOutlet weak var iconBackgroundView: UIView!
    
    class func newInstance() -> TrainingViewController {
        let trainingViewController = TrainingViewController()
        
        return trainingViewController
    }

    @IBAction func handleLogout(_ sender: UIButton) {
        if (UserDefaults.standard.string(forKey: "uId") != nil){
            let parameter = "{\n    \"id\" : \"\(UserDefaults.standard.string(forKey: "uId")!)\"\n"
            UserWebService.logoutUser(parameters: parameter)
            self.navigationController?.pushViewController(HomeViewController(), animated: true)
            
        }
        
        else{
            print("MARCHE PAS")
        }
        
    }
    override func viewDidLoad() {
        self.navigationController?.navigationBar.removeFromSuperview()
        
        super.viewDidLoad()

//        self.photoTableView.dataSource = self
//        self.photoTableView.delegate = self
//        let photoCellNib = UINib(nibName: "PhotoTableViewCell", bundle: nil) // nib correspond à un xib compilé
//        self.photoTableView.register(photoCellNib, forCellReuseIdentifier: "PhotoCellId") // identifiant permettant de générer ce type de cellule
        
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return self.photos?.count ?? 0
//        }
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCellId", for: indexPath) as! PhotoTableViewCell
//            cell.redraw(with: self.photos![indexPath.row])
//            return cell
//        }
    }
}
