//
//  ClassTableViewCell.swift
//  SubmissionPhase1
//
//  Created by Mohit.
//  Copyright © 2018 Mohit D. All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {

    @IBOutlet weak var ClassNameLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
