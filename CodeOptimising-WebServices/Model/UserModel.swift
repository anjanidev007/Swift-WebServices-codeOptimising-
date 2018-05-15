//
//  UserModel.swift
//  CodeOptimising-WebServices
//
//  Created by anjani on 06/05/2018.
//  Copyright © 2018 anjani. All rights reserved.
//

import Foundation
import SwiftyJSON

/// User Model data
struct UserModel {
    var name = String()
    var username = String()
    var email = String()
    var phone = String()
    var address:userAddress?
    var company:userCompany?
    
    init(userJson:JSON) {
        self.name = userJson["name"].stringValue
        self.username = userJson["username"].stringValue
        self.email = userJson["email"].stringValue
        self.phone = userJson["phone"].stringValue
        self.address = userAddress(addressJson: userJson["address"])
        self.company = userCompany(companyJson:userJson["company"])
    }
}
struct userAddress {
    var street = String()
    var suite = String()
    var city = String()
    
    init(addressJson:JSON) {
        self.street = addressJson["street"].stringValue
        self.suite = addressJson["suite"].stringValue
        self.city = addressJson["city"].stringValue
    }
}

struct userCompany {
    var companyName = String()
    // var phrase:String?
    init(companyJson:JSON) {
        self.companyName = companyJson["name"].stringValue
        //   self.phrase = companyJson["catchPhrase"].stringValue
    }
}
