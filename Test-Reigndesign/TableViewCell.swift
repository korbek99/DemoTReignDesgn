//
//  TableViewCell.swift
//  Test-Reigndesign
//
//  Created by Jose David Bustos H on 07-07-18.
//  Copyright © 2018 Jose David Bustos H. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var namedesc: UILabel!
    
    @IBOutlet weak var nameAutor: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
