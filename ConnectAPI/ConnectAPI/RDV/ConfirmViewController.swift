//
//  ConfirmViewController.swift
//  ConnectAPI
//
//  Created by Mohamed El Fakharany on 31/05/2023.
//

import UIKit

class ConfirmViewController: UIViewController {
    var gender: String!
    var subject: String!
    var address: String!

    @IBOutlet weak var titleLabel: UILabel!
    
    class func newInstance(gender: String, subject: String, address: String) -> ConfirmViewController {
        let confirmViewController = ConfirmViewController()
        
        confirmViewController.gender = gender
        confirmViewController.subject = subject
        confirmViewController.address = address
        
        return confirmViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = subject + " chez " + gender
    }

}
