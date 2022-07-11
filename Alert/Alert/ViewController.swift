//
//  ViewController.swift
//  Alert
//
//  Created by 정지훈 on 2022/07/11.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var lamping: UIImageView!
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        lamping.image = imgOn
    }
    
    @IBAction func btnLampOn(_ sender: UIButton) {
        //alert설정
        if(isLampOn){
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert)
            //alert 확인 후 이벤트 필요 없으면 handler nil
            let onAction = UIAlertAction(title: "예, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }else {
            lamping.image = imgOn
            isLampOn = true
        }
        
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if(isLampOn) {
            
            let lampOffAlert = UIAlertController(title: "램프끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { ACTION in self.lamping.image = self.imgOff
                self.isLampOn = false
            })
            let cancleAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancleAction)
            present(lampOffAlert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func btnLampRemove(_ sender: Any) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let lampOnAction = UIAlertAction(title: "램프 켜기", style: UIAlertAction.Style.default, handler: {ACTION in
            self.lamping.image = self.imgOn
            self.isLampOn = true
        })
        let lampOffAction = UIAlertAction(title: "램프 끄기", style: UIAlertAction.Style.default, handler: {ACTION in
            self.lamping.image = self.imgOff
            self.isLampOn = false
        })
        let lampRemoveAction = UIAlertAction(title: "램프 제거", style: UIAlertAction.Style.default, handler: {ACTION in
            self.lamping.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(lampOnAction)
        lampRemoveAlert.addAction(lampOffAction)
        lampRemoveAlert.addAction(lampRemoveAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

