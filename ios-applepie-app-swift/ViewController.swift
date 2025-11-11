//
//  ViewController.swift
//  ios-applepie-app-swift
//
//  Created by otavio brito on 10/11/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TreeImageView: UIImageView!
    @IBOutlet weak var WordLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet var WordButton: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func WordButtonPress(_ sender: UIButton) {
        sender.isEnabled = false
    }
}

