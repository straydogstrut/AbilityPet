//
//  RoundedButton.swift
//  AbilityPet
//
//  Created by Daniel James Mclaughlan on 01/02/2019.
//  Copyright © 2019 AbilityNet. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
    }
    */
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 6
    }

}
