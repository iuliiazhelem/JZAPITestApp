//
//  AnimalInfoViewController.swift
//  JZAPITestApp
//
//  Created 10/11/22.
//

import Foundation
import UIKit

class AnimalInfoViewController: UIViewController {
    
    var item: Animal?
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var latinNameLabel: UILabel!

    
    @IBOutlet weak var lifespanValueLabel: UILabel!
    @IBOutlet weak var habitatValueLabel: UILabel!
    @IBOutlet weak var dietValueLabel: UILabel!
    @IBOutlet weak var geoValueLabel: UILabel!
    @IBOutlet weak var typeValueLabel: UILabel!
    @IBOutlet weak var activeValueLabel: UILabel!
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let item = item else { return }
        
        nameLabel.text = item.name
        latinNameLabel.text = item.latin_name
        typeValueLabel.text = item.animal_type
        activeValueLabel.text = item.active_time
        lifespanValueLabel.text = item.lifespan
        weightValueLabel.text = "\(item.weight_min) - \(item.weight_max)"
        heightValueLabel.text = "\(item.length_min) - \(item.length_max)"
        habitatValueLabel.text = item.habitat
        dietValueLabel.text = item.diet
        geoValueLabel.text = item.geo_range
        if let url = URL(string: item.image_link) {
            mainImageView.load(url: url)
        }
    }
}
