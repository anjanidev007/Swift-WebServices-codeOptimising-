//
//  DataTable.swift
//  CodeOptimising-WebServices
//
//  Created by anjani on 06/05/2018.
//  Copyright © 2018 anjani. All rights reserved.
//

import UIKit

class DataTable: UITableView,UITableViewDelegate,UITableViewDataSource {
   
    // didSet is proerty Observer for reloadData()
    var dataSourceArray = [UserModel](){
        didSet{
            reloadData()
        }
    }
    
    // creating tableview programmatically this initilizer is called
    override init (frame:CGRect,style:UITableViewStyle) {
       super.init(frame: frame, style: style)
    }
    
    //when we create tableview through storyboard then this is called
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // after usertables  loads on screen then this function is called only once
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UsersCell = tableView.dequeueReusableCell(withIdentifier: "UsersCell", for:indexPath) as! UsersCell
        
        let myUser = self.dataSourceArray[indexPath.row]
        cell.NameLb.text = myUser.name
        cell.UserNameLb.text = myUser.username
        cell.EmailLb.text = myUser.email
        cell.PhoneNumberLb.text = myUser.phone
        cell.CompanyNameLb.text = myUser.company?.companyName
        cell.CompanyAddressLb.text = myUser.address?.street
        
        return cell
    }
    
}



























