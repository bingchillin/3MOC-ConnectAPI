//
//  RDVViewController.swift
//  ConnectAPI
//
//  Created by Mohamed El Fakharany on 31/05/2023.
//

import UIKit

class RDVViewController: UIViewController {

    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var appointView: MainView!
    @IBOutlet weak var dateView: CardView!
    
    @IBAction func onClickDateView(_ sender: Any) {
        let confirmVC = ConfirmViewController()
            confirmVC.gender = genderLabel.text
            confirmVC.subject = subjectLabel.text
            confirmVC.address = addressLabel.text
            self.navigationController?.pushViewController(confirmVC, animated: true)
    }
    
    let gender = 0
    let subject = 0
    let clientAddress = "242 Faubourg Saint-Antoine"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if gender == 0 {
            genderLabel.text = "M. Kenny SU"
        } else if gender == 1 {
            genderLabel.text = "Mme. Thanudi Madawala"
        } else {
            genderLabel.text = "Il semblerait y avoir une erreur..."
        }
        
        if subject == 0 {
            subjectLabel.text = "Aide ménagère"
            appointView.backgroundColor = UIColor(named: "backgroundOrange")
        } else if subject == 1 {
            subjectLabel.text = "Aide médicale"
        } else {
            subjectLabel.text = "Il semblerait y avoir une erreur..."
        }
        
        addressLabel.text = clientAddress
    }

}
