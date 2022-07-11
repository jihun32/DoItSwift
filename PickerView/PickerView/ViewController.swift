//
//  ViewController.swift
//  PickerView
//
//  Created by 정지훈 on 2022/07/11.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblimageFileName: UILabel!
    @IBOutlet var ImageView: UIImageView!

    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    //PicerView 이미지로 했을때 높이 설정
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = [ "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblimageFileName.text = imageFileName[0]
        ImageView.image = imageArray[0]
    }

    //피커뷰의 컴포넌트 개수 설정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
        
    }
    
    //피커뷰의 항목 개수 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    //피커뷰 항목 높이 설정
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    //PickerView 항목 텍스트로 나타내기
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    //피커뷰 이미지로 나타낼 때 각 항목 view 설정
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        return imageView
    }
    //피커뷰 선택했을 때 설정
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblimageFileName.text = imageFileName[row]
        ImageView.image = imageArray[row]
    }
}

