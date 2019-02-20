//
//  ViewController.swift
//  WatchAppGuess
//
//  Created by kuroky on 2019/2/20.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {

    private var wcsession: WCSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let generateNumberBtn = UIButton.init(type: .custom)
        generateNumberBtn.frame = CGRect.init(x: 10, y: 10, width: 200, height: 50)
        generateNumberBtn.setTitle("Generate Number", for: .normal)
        generateNumberBtn.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(generateNumberBtn)
        generateNumberBtn.backgroundColor = UIColor.lightGray
        generateNumberBtn.center = self.view.center
        generateNumberBtn.addTarget(self, action: #selector(generateNumber), for: .touchUpInside)
        
        wcsession = WCSession.default
        if WCSession.isSupported() {
            wcsession.delegate = self
            wcsession.activate()
        }
        self.view.backgroundColor = UIColor.yellow
    }

    @objc func generateNumber() {
        let number: Int = Int(arc4random()) % 5 + 1
        
        do {
            try wcsession.updateApplicationContext(["numberToBeGuessed" : number])
        } catch {
            print("error")
        }
        print(number)
    }
    

}

extension ViewController: WCSessionDelegate {
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("")
    }
}

