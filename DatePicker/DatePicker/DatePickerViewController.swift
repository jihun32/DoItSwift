//
//  ViewController.swift
//  DatePicker
//
//  Created by 정지훈 on 2022/07/11.
//

import UIKit

class DatePickerViewController: UIViewController {

    //타이머가 구더ㅗㅇ되면 실행할 함수를 지정
    let timeSelector: Selector = #selector(DatePickerViewController.updateTime)
    let interval = 1.0
    //설정한 간격대로 실해오디는지 확인하는 변수
    var count = 0
    
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //인수 의미 : 시간 간격, 비춰질 뷰, 사용할 함수, 유저 정보, 반복 여부
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }



    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간: " +
        formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        //0에서 1씩 늘어나는지 확인
//        lblCurrentTime.text = String(count)
//        count += 1
        //현재 시간 가져오는 함수
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재 시간 : " + formatter.string(from: date as Date)
    }
}

