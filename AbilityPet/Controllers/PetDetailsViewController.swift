//
//  PetDetailsViewController.swift
//  AbilityPet
//
//  Created by Daniel James Mclaughlan on 29/01/2019.
//  Copyright © 2019 AbilityNet. All rights reserved.
//

import UIKit

class PetDetailsViewController: UIViewController {
    
    //MARK: Properties
    var petImage = UIImage()
    var petName = String()
    var petDescription = String()
    var petStats = NSDictionary()
    
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petDescriptionTextView: UITextView!
    
    @IBOutlet weak var petStatsTextView: UITextView!
    @IBOutlet weak var contactButton: UIButton!

    @IBAction func askButtonTouched(_ sender: UIButton) {
        print("send email")
        
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
        petImageView.isAccessibilityElement = true
        petImageView.image = petImage
        petNameLabel.text = "Hi, I'm " + (petName)
        petDescriptionTextView.text = petDescription
        
        let petGender = petStats.object(forKey: "gender") as! String
        let petBreed = petStats.object(forKey: "breed") as! String
        let petAge = petStats.object(forKey: "age") as! String
        let petPersonality = petStats.object(forKey: "personality") as! String
        
        petStatsTextView.text = "Gender: " + petGender + "\n" +
                                "Breed: " + petBreed + "\n" +
                                "Age: " + petAge + "\n" +
                                "Personality: " + petPersonality
        
      
        
        // Do any additional setup after loading the view.
       
      //  contactButton.accessibilityTraits = UIAccessibilityTraits.none
        contactButton.accessibilityHint = "Opens Mail"
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
