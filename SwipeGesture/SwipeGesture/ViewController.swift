//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 정지훈 on 2022/07/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgViewUp: UIImageView!
    @IBOutlet var imgViewRight: UIImageView!
    @IBOutlet var imgViewLeft: UIImageView!
    @IBOutlet var imgViewDown: UIImageView!
    
    let numOfTouch = 2
    
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //이미지 배열에 이미지 할당하기
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        imgUp.append(UIImage(named: "arrow-up-green.png")!)
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-green.png")!)
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgLeft.append(UIImage(named: "arrow-left-red.png")!)
        imgLeft.append(UIImage(named: "arrow-left-green.png")!)
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        imgRight.append(UIImage(named: "arrow-right-green.png")!)
        
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
        
        //스와이프 제스처 등록
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpMulti.numberOfTouchesRequired = numOfTouch
        self.view.addGestureRecognizer(swipeUpMulti)
        
        let swipeDowntMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeDowntMulti.direction = UISwipeGestureRecognizer.Direction.down
        swipeDowntMulti.numberOfTouchesRequired = numOfTouch
        self.view.addGestureRecognizer(swipeDowntMulti)
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.numberOfTouchesRequired = numOfTouch
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightMulti.numberOfTouchesRequired = numOfTouch
        self.view.addGestureRecognizer(swipeRightMulti)
        
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        //만일 제스쳐가 있다면
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            //검은색 으로 초기화
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            //제스쳐에 맞게 이미지 변환
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[1]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[1]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[1]
            default :
                break
            }
        }
    }
    
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            //검은색 으로 초기화
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            //제스쳐에 맞게 이미지 변환
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[2]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[2]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[2]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[2]
            default :
                break
            }
        }
    }
    


}

