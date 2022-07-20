//
//  EditViewController.swift
//  Navigation
//
//  Created by 정지훈 on 2022/07/19.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {

    @IBOutlet var btnZoom: UIButton!
    @IBOutlet var swlsOn: UISwitch!
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var textBtnZoom: String = ""
    var delegate: EditDelegate?
    var isOn = false
    var isZoom = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblWay.text = textWayValue
        txMessage.text = textMessage
        swlsOn.isOn = isOn
        btnZoom.setTitle(textBtnZoom, for: UIControl.State())
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func btnZoom(_ sender: UIButton) {
        if isZoom {
            btnZoom.setTitle("축소", for: UIControl.State())
        } else {
            btnZoom.setTitle("확대", for: UIControl.State())
        }
        isZoom = !isZoom
        
    }
    //메인화면으로 데이터 보내기
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageZoomDone(self, isZoom: isZoom)
        }
        //완료 버튼시 메인 화면으로 돌아가는 코드
        _ = navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
