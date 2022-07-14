//
//  ViewController.swift
//  Mission03
//
//  Created by 정지훈 on 2022/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var present = 1;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "1.png")
    }

    @IBAction func btnPre(_ sender: UIButton) {
        if(present > 1){
            present -= 1
            let imgName = String(present) + ".png"
            imageView.image = UIImage(named: imgName)
        }
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        if(present < 6){
            present += 1
            let imgName = String(present) + ".png"
            imageView.image = UIImage(named: imgName)
        }
    }
    
}

