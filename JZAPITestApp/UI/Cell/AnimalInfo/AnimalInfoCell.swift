//
//  AnimalInfoCell.swift
//  JZAPITestApp
//
//  Created on 10/11/22.
//

import Foundation
import UIKit

class AnimalInfoCell: UITableViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var latinNameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
        latinNameLabel.text = nil
        
        mainImageView.image = nil
    }
}
