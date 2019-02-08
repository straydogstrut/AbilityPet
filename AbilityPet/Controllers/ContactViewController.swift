//
//  ContactViewController.swift
//  AbilityPet
//
//  Created by Daniel James Mclaughlan on 07/02/2019.
//  Copyright © 2019 AbilityNet. All rights reserved.
//
import QuartzCore
import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var subjectTextField: UITextField!
    
    @IBOutlet weak var enquiryTextView: UITextView!
    @IBOutlet weak var submitButton: RoundedButton!
    @IBAction func submitButtonTapped(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameTextField.borderStyle = .roundedRect
        phoneTextField.borderStyle = .roundedRect
        emailTextField.borderStyle = .roundedRect
        subjectTextField.borderStyle = .roundedRect
        
        //To make the border look like that of a UITextField with roundedRect
        enquiryTextView.layer.borderColor = UIColor.gray.withAlphaComponent(0.25).cgColor
        enquiryTextView.layer.borderWidth = 1.0
        
        //The rounded corner part, where you specify your view's corner radius:
        enquiryTextView.layer.cornerRadius = 5;
        enquiryTextView.clipsToBounds = true;
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
