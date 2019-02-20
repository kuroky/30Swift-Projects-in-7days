//
//  InterfaceController.swift
//  WatchAppGuessExtension Extension
//
//  Created by kuroky on 2019/2/20.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    
    @IBOutlet weak var resultSlider: WKInterfaceSlider!
    @IBOutlet weak var resultLabel: WKInterfaceLabel!
    @IBOutlet weak var resultConfirmButton: WKInterfaceButton!
    @IBOutlet weak var resultOfGuess: WKInterfaceLabel!
    
    private var numberOfSlider: Int!
    private var numberToBeGuessed = 3
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        resultSlider.setValue(0)
        resultLabel.setText("Your guess: 0")
        resultConfirmButton.setTitle("Guess")
        resultOfGuess.setText("Open iPhone App first")
        super.willActivate()
    }
    
    override func didDeactivate() {
        
        super.didDeactivate()
    }

    @IBAction func sliderUpdate(_ value: Float) {
        numberOfSlider = Int(value * 5)
        resultLabel.setText("Your guess: \(numberOfSlider!)")
    }
    
    @IBAction func guessAction() {
        if numberOfSlider == numberToBeGuessed {
            resultOfGuess.setText("正确")
        }
        else {
            resultOfGuess.setText("Wrong")
        }
    }
    
   
}

extension InterfaceController: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        numberToBeGuessed = applicationContext["numberToBeGuessed"] as! Int
    }
}
