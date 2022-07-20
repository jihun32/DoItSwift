//
//  ViewController.swift
//  Navigation
//
//  Created by 정지훈 on 2022/07/19.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
   
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    var isOn = true
    var isZoom = false
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var txMessage: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }

    //해당 세그웨이가 해당 뷰 컨트롤러로 전환되기 직전에 호출되는 함수, 데이터 전달을 위해 사용
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //EditViewController 받아오기
        let editViewController = segue.destination as! EditViewController
  
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
            
        }
        else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.delegate = self
        editViewController.isOn = isOn
        editViewController.isZoom = isZoom
        if isZoom {
            editViewController.textBtnZoom = "축소"
        } else {
            editViewController.textBtnZoom = "확대"
        }
    }
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale: CGFloat = 2.0
        var newWidth:CGFloat, newHeight: CGFloat
        
        if isZoom {
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            self.isZoom = false
        } else {
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            self.isZoom = true
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
    }
    

}

