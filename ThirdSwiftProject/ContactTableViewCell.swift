//
//  ContactTableViewCell.swift
//  ThirdSwiftProject
//
//  Created by Rhinoda3 on 13.07.16.
//  Copyright © 2016 Rhinoda. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

	@IBOutlet weak var name: UILabel!
	@IBOutlet weak var email: UILabel!
	@IBOutlet weak var phone: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
