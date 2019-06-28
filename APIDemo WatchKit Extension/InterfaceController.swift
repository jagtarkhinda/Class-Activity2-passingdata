//
//  InterfaceController.swift
//  APIDemo WatchKit Extension
//
//  Created by Parrot on 2019-03-03.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire
import SwiftyJSON


class InterfaceController: WKInterfaceController {
    
    
    // MARK: Outlet
    // ---------------
 
    @IBOutlet var watchOutputLabel: WKInterfaceLabel!
    
    @IBOutlet var getmessage: WKInterfaceLabel!
    
    // MARK: Actions
    @IBAction func getDataPressed() {
        print("Watch button pressed")
        // TODO: Put your API call here
        let URL = "https://httpbin.org/get"
        //let URL = "https://jsonplaceholder.typicode.com/posts"
        
        Alamofire.request(URL).responseJSON {
            
            response in
            
            // TODO: Put your code in here
            // ------------------------------------------
            // 1. Convert the API response to a JSON object
            
            // -- check for errors
            let apiData = response.result.value
            if (apiData == nil) {
                print("Error when getting API data")
                return
            }
            // -- if no errors, then keep going
            
            print(apiData)
            
            
            // 2. Parse out the data you need (sunrise / sunset time)
            
            // example1 - parse a dictionary
            
            // 2a. Convert the response to a JSON object
            let jsonResponse = JSON(apiData)
            
            // 2b. Get a key from the JSON object
            let origin = jsonResponse["origin"]
            let host = jsonResponse["headers"]["Host"]
            
            // 3. Show the data in the user interface
            self.watchOutputLabel.setText("\(origin)")
        }
    }
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
     
        
        
    }
   
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
