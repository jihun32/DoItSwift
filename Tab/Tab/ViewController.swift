//
//  ViewController.swift
//  Tab
//
//  Created by 정지훈 on 2022/07/19.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func btnMoveImageView(_ sender: UIButton) {        tabBarController?.selectedIndex = 1
    }
}

