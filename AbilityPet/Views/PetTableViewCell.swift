//
//  PetTableViewCell.swift
//  AbilityPet
//
//  Created by Daniel James Mclaughlan on 28/01/2019.
//  Copyright © 2019 AbilityNet. All rights reserved.
//

import UIKit

class PetTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

extension PetTableViewCell {
    func applyAccessibility(){
        photoImageView.isAccessibilityElement = true
    }
}
