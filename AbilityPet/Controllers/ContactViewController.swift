//
//  ContactViewController.swift
//  AbilityPet
//
//  Created by Daniel James Mclaughlan on 07/02/2019.
//  Copyright © 2019 AbilityNet. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var submitButton: RoundedButton!
    @IBAction func submitButtonTapped(_ sender: Any) {
        let email = "foo@bar.com"
        if let url = URL(string: "mailto:\(email)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameTextField.borderStyle = .roundedRect
        phoneTextField.borderStyle = .roundedRect
        emailTextField.borderStyle = .roundedRect
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

extension ContactViewController{
    func applyAccessibility(){
      //  submitButton.accessibilityHint = "Opens Mail"
    }
}
