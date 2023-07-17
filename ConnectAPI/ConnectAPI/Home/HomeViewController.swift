//
//  HomeViewController.swift
//  ConnectAPI
//
//  Created by Thanudi Madawala on 11/01/2023.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var currentMissionView: CardView!
    @IBOutlet weak var currentMissionTitle: UILabel!
    @IBOutlet weak var currentMissionLabel: UILabel!
    
    let choice = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if choice == 1 {
            currentMissionView.backgroundColor = UIColor(named: "backgroundBlue")
            currentMissionLabel.text = "Mission 1"
        } else {
            currentMissionLabel.text = "VOUS N'AVEZ PAS DE MISSION EN COURS"
        }
        
    }
    
}
