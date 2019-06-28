//
//  ViewController.swift
//  APIDemo
//
//  Created by Parrot on 2019-03-03.
//  Copyright © 2019 Parrot. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import WatchConnectivity


class ViewController: UIViewController, WCSessionDelegate {
    
    var session: WCSession!
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {

    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {

    }

    func sessionDidDeactivate(_ session: WCSession) {

    }
    
    
    @IBOutlet weak var getMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (WCSession.isSupported()) {
            
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else{
           getMessage.text = ("Phone can not connect to the watch")
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Requirement 1, sending message to watch
    @IBAction func sendFirstMessage(_ sender: Any) {
        
        let msg = ["Key": "msg from fone"]
         WCSession.default.sendMessage(msg, replyHandler: nil)
    }
    
    
    //Requirement 2, receiving message from watch and sending the response back
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        //handle received message
        let value = message["Value"] as? String
        DispatchQueue.main.async{
            self.getMessage.text = value
        }
        //send a reply
        replyHandler(["Value": "Got the message"])
    }
    }


