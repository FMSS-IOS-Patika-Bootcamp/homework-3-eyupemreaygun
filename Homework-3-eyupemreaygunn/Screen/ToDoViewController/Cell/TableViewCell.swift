//
//  TableViewCell.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 23.09.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var toDoLbl: UILabel!
    @IBOutlet weak var selectedThick: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
