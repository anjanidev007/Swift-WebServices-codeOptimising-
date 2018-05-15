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
    /*
     isFectched ->Bool assume
     fetchData() {(isFatched) in
     
     if isFected {
     we will get the data
     } else {
     still it taking time or network problem
     }
     }
     */
func fetchData() {
    //calling getdatafromUrl to Fetch
   APIManager.shared.getDataFromUrl() {(isFetched) -> Void in
    // if completionHandler is true excute this block of code
   
    self.view.activityStartAnimating(activityColor: UIColor.white, backgroundColor: UIColor.black.withAlphaComponent(0.3))
    
    if isFetched != nil {
        //isfetched is true or not equals to nil then from url we fetch list of Data and relaod in tableView
        self.myResonse = isFetched
            
            for i in 0..<self.myResonse.count {
                
                let singleUser = UserModel(userJson: self.myResonse[i])
                self.users.append(singleUser)
            }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            // your code here
          //  DispatchQueue.global(qos: .background).async {
                // Background Thread
                DispatchQueue.main.async {
                    // Run UI Updates or call completion block
                  
                    self.view.activityStopAnimating()
                    self.mytable.dataSourceArray = self.users
                   
                }
            }
            
        } else  {
        
        self.view.activityStopAnimating()
            print("server or internet problem")
    }
    }
    
        
    }
    
}












