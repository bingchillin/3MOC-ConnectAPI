//
//  AboutViewController.swift
//  ConnectAPI
//
//  Created by Mohamed El Fakharany on 08/03/2023.
//

import UIKit
import AVKit

class AboutViewController: UIViewController {
    
    @IBAction func playBtn(_ sender: Any) {
        let url = Bundle.main.url(forResource: "rizzler", withExtension: "mp4")
        let avPlayer = AVPlayer(url: url!)
        let avController = AVPlayerViewController()
        avController.player = avPlayer
        present(avController, animated: true) {
            avPlayer.play()
        }
    }
    
    @IBAction func bounceButton(_ sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
