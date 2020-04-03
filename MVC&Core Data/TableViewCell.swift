//
//  TableViewCell.swift
//  MVC&Core Data
//
//  Created by Luiza Fattori on 03/04/20.
//  Copyright © 2020 Luiza Fattori. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var cursoLabel: UILabel!
    @IBOutlet weak var tiaLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
