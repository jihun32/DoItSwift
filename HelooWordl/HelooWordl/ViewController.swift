//
//  ViewController.swift
//  HelooWordl
//
//  Created by 정지훈 on 2022/07/09.
//

import UIKit

class ViewController: UIViewController {
    //IB는 Interface NUilder의 약자, 객체를 소스 코드에 참조하기위해 사용하는 키워드이며 주로 객체의 속성을 제어하는데 사용
    //strong은 다른 곳에서 참조시 메모리 제거X weak는 다른 곳에서 참조하고 있더라도 임의적으로 제걱 가능 메모리 누수 이슈
    @IBOutlet var lblHello: UILabel!
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text = "Hello, " + txtName.text!
    }
}

