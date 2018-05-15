//
//  Extensions.swift
//  CodeOptimising-WebServices
//
//  Created by anjani on 07/05/2018.
//  Copyright © 2018 anjani. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    // query to server
    func queryToServer(urlSource:String,postString:[String:Any],result:@escaping (_ dataResult:Data?,_ errorResult:Error) -> ()) {
        let url:URL = URL(string:urlSource)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                // your code here
                //  DispatchQueue.global(qos: .background).async {
                // Background Thread
                DispatchQueue.main.async {
                   
                    if error == nil
                    {
                        result(data, error!)
                        
                    }
                    else {
                        result(nil,  error!)
                    }
                }
            }
        }
   
    }
    
    
   //AlertView
    
    func ShowAlert(title:String,message:String,controller:UIViewController) {
        
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alertAction)
        
        controller.present(alertController, animated: true, completion: nil)
        
}


}












