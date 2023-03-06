//
//  TrainingViewController.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 09/02/2023.
//

import UIKit

class TrainingViewController: UIViewController {
    
    @IBOutlet weak var iconBackgroundView: UIView!
    class func newInstance() -> TrainingViewController {
        let trainingViewController = TrainingViewController()
        
        return trainingViewController
    }

    override func viewDidLoad() {
        self.navigationController?.navigationBar.removeFromSuperview()
        iconBackgroundView.layer.cornerRadius = 20
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
