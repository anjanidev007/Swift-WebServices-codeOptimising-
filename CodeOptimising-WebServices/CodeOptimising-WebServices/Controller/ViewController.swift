//
//  ViewController.swift
//  CodeOptimising-WebServices
//
//  Created by anjani on 06/05/2018.
//  Copyright © 2018 anjani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    var myResonse:JSON = nil

    @IBOutlet weak var mytable: DataTable!
    
    
    var users:[UserModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
// for fetchdata we have to use Completion Handler
func fetchData() {
   APIManager.shared.getDataFromUrl() {(userJson) -> Void in
        if userJson != nil {
            self.myResonse = userJson
            
            for i in 0..<self.myResonse.count {
                
                let singleUser = UserModel(userJson: self.myResonse[i])
                self.users.append(singleUser)
            }
            
            DispatchQueue.global(qos: .background).async {
                // Background Thread
                DispatchQueue.main.async {
                    // Run UI Updates or call completion block
                   self.mytable.dataSourceArray = self.users
                   
                }
            }
            
        }
    }
    
    
 
        
    }
    
}












