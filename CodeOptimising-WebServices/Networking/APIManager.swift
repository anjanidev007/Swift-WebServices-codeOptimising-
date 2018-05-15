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
    //Singleton
    static let shared = APIManager()
    private init() {
        
    }
    //NETWORK Operation Fuction /// we can call this in viewcontroller or anywhere
    // onCompletion:(Bool) -> Void we add there to check true or false for completion handler(takes times to fetch data from server that is the reason we use completion handler to let us know is fetched or not ) oncomletion(Bool)->void
    func getDataFromUrl(onCompletion:@escaping (JSON) -> Void) {
        //GET
        let url  = URL(string:BaseUrl)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        Alamofire.request(request).responseJSON { response in
            
            switch response.result {
                
            case .success(let data):
                let myResponse = JSON(data)
                onCompletion(myResponse)
                // print(myResponse)
                
                
            case .failure(let error):
                print("request failed with error \(error.localizedDescription)")
                onCompletion(nil)
                
            }
        }
        
    }
    
func loginPostRequest(_ parameters:[String:Any],header: [String: String], completionHandler:@escaping (Any?,Error?) -> ())
{
    Alamofire.request(loginURL,method:HTTPMethod.post,parameters:parameters,encoding:JSONEncoding.default,headers:header).responseJSON { response in
      
            switch response.result {
                
            case .success(let data) :
                let myResponse = JSON(data)
                completionHandler(myResponse, nil)
                print("sucess:",data)
            case .failure(let error):
                print(error)
                 completionHandler(nil, error)
            }
        }
    }
}




















