//
//  ViewController.swift
//  ImageView
//
//  Created by 정지훈 on 2022/07/09.
//

import UIKit

class ViewController: UIViewController {
    var isZomm: Bool = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }

    @IBAction func btnResizeImage(_ sender: Any) {
        let scale:CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if (isZomm) {
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            btnResize.setTitle("확대", for: .normal)
        } else {
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZomm = !isZomm
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        }
        else {
            imgView.image = imgOff
        }
    }
}

