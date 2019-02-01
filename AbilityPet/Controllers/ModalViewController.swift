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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
