//
//  UsersCell.swift
//  CodeOptimising-WebServices
//
//  Created by anjani on 06/05/2018.
//  Copyright © 2018 anjani. All rights reserved.
//

import UIKit

class UsersCell: UITableViewCell {
    @IBOutlet weak var NameLb: UILabel!
    @IBOutlet weak var UserNameLb: UILabel!
    @IBOutlet weak var EmailLb: UILabel!
    @IBOutlet weak var PhoneNumberLb: UILabel!
    @IBOutlet weak var CompanyNameLb: UILabel!
    @IBOutlet weak var CompanyAddressLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
