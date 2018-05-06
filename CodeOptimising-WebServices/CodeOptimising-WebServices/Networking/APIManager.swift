//
//  APIManager.swift
//  CodeOptimising-WebServices
//
//  Created by anjani on 06/05/2018.
//  Copyright © 2018 anjani. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class APIManager {
    
    static let shared = APIManager()
    private init() {
        
    }
    //NETWORK Operation Fuction /// we can call this in viewcontroller or anywhere
    // onCompletion:(Bool) -> Void we add there to check true or false for completion handler
    func getDataFromUrl(onCompletion:@escaping (JSON) -> Void) {
        //GET
        let url  = URL(string:BaseUrl)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //now we created the request we will fire with alamofire
        
        
        Alamofire.request(request).responseJSON { response in
            switch response.result {
                
            case .success(let data):
           let myResponse = JSON(data)
            onCompletion(myResponse)
            //  print("******Successfully got the response**** ->>",data, "<<-******Successfully got the response**** ")
                
                
            case .failure(let error):
            print("request failed with error \(error.localizedDescription)")
            onCompletion(nil)
                
            }
        }
     
    }
}
