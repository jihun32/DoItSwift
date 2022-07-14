//
//  ViewController.swift
//  Mission04
//
//  Created by 정지훈 on 2022/07/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var selectionTime: UILabel!
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var alarmTime: String = ""
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        let current = formatter.string(from: date as Date)
        currentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        if(alarmTime == current){
            view.backgroundColor = UIColor.red
            count += 1
            
        }
        
        if(count != 0){
            count += 1
        }
        
        if(count == 60){
            view.backgroundColor = UIColor.white
            count = 0;
        }
    }
    
    @IBAction func DatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
        selectionTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
    }
    
}

