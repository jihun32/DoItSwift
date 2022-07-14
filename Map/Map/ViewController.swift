//
//  ViewController.swift
//  Map
//
//  Created by 정지훈 on 2022/07/12.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    @IBOutlet var myMap: MKMapView!
    
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManger.delegate = self
        //정확도 최고로 설정
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        //사용자에게 위치사용 여부 승인
        locationManger.requestWhenInUseAuthorization()
        //위치 업데이트 시작
        locationManger.startUpdatingLocation()
        //위치 보기 값 설정
        myMap.showsUserLocation = true
        
    }
    
    //위도 경도 입력받아 그 위치로 가기
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D{
        
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
        
    }
    
    //원하는 위치에 핀 설치
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    //위치가 업데이트 됐을 때 지도에 위치 나타내기위한 함수
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //위치 업데이트 된 후 마지막(현재?) 위치 값 받기
        let pLocation = locations.last
        //delta 0.01 = 100배 확대
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            
            let pm = placemarks!.first
            let country = pm!.country
            var address: String = country!
            //지역 값 존재시 문자열에 추가
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            //도로 값 존재시 문자열에 추가
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
            
        })
        
        //마지막으로 위치가 업데이트되는 것을 멈춤
        locationManger.stopUpdatingLocation()
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManger.startUpdatingLocation()
        }
        else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitudeValue: 37.751853, longitudeValue: 128.87605740000004, delta: 1, title: "한국 폴리텍대학 강릉 캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한국 폴리텍대학 강릉캠퍼스"
        }
        else if sender.selectedSegmentIndex == 2 {
            
            setAnnotation(latitudeValue: 37.556876, longitudeValue: 126.914066, delta: 0.1, title: "이지스 퍼블리싱", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "이지스 퍼블리싱 출판사"
        }
    }
}

