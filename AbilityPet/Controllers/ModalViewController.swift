//
//  ModalViewController.swift
//  AbilityPet
//
//  Created by Daniel James Mclaughlan on 01/02/2019.
//  Copyright © 2019 AbilityNet. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBAction func dismissModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension ModalViewController {
    func applyAccessibility(){
        
    }
}
