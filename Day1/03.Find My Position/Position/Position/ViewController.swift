//
//  ViewController.swift
//  Position
//
//  Created by kuroky on 2019/2/14.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import SnapKit
import CoreLocation

class ViewController: UIViewController {

    private var positionLabel: UILabel!
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager.init()
        manager.delegate = self
        manager.distanceFilter = kCLLocationAccuracyHundredMeters
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        return manager
    }()
    private var geocoder = CLGeocoder.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }

    func setupData() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor.lightGray
        let findBtn = UIButton.init(type: .custom)
        findBtn.addTarget(self, action: #selector(findMyPosition), for: .touchUpInside)
        findBtn.setTitle("Find My Position", for: .normal)
        self.view.addSubview(findBtn)
        findBtn.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading).offset(30)
            make.trailing.equalTo(self.view.snp.trailing).offset(-30)
            make.bottom.equalTo(self.view.snp.bottom).offset(-30)
            make.height.equalTo(Double(40))
        }
        
        positionLabel = UILabel.init(frame: .zero)
        positionLabel.textColor = UIColor.white
        positionLabel.numberOfLines = 0
        positionLabel.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(positionLabel)
        positionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(40)
            make.leading.equalTo(self.view.snp.leading).offset(20)
            make.trailing.equalTo(self.view.snp.trailing).offset(-20)
            make.height.equalTo(Double(50))
        }
        
    }
    
    @objc func findMyPosition() {
        locationManager.startUpdatingLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        convertWithLocation(location: location) { [weak self] address in
            if let strongSelf = self {
                let locationStr = "lat:\(location.coordinate.latitude) lng:\(location.coordinate.longitude)"
                strongSelf.positionLabel.text = locationStr + address
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        manager.stopUpdatingLocation()
    }
    
    func convertWithLocation(location: CLLocation, closure: @escaping (String) -> Void) {
        geocoder.reverseGeocodeLocation(location) { (places, error) in
            if error != nil {
                closure("")
                return
            }
            guard let placemark: CLPlacemark = places?.first else {
                closure("")
                return
            }
            
            let country = placemark.country ?? ""
            let city =  placemark.locality ?? ""
            let street = placemark.thoroughfare ?? ""
            let finalAddress: String = "\(country)\(city)\(street)"
            closure(finalAddress)
        }
    }
}
