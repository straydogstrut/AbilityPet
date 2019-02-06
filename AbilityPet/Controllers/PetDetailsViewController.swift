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
    var petLiked = Bool()
    
    @IBOutlet weak var petLikeButton: UIButton!
    @IBAction func petLikeButtonTouched(_ sender: UIButton){
        petLiked(!petLiked)
    }
    
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
        petLiked(false)
        
        
        let petGender = petStats.object(forKey: "gender") as! String
        let petBreed = petStats.object(forKey: "breed") as! String
        let petAge = petStats.object(forKey: "age") as! String
        let petPersonality = petStats.object(forKey: "personality") as! String
        
        petStatsTextView.text = "Gender: " + petGender + "\n" +
                                "Breed: " + petBreed + "\n" +
                                "Age: " + petAge + "\n" +
                                "Personality: " + petPersonality
       
        }
    
   // MARK: Private methods
    func petLiked(_ liked: Bool){
        if liked {
            petLikeButton.setImage(UIImage(named:"heart_red"), for: .normal)
            petLiked = true
        } else {
            petLikeButton.setImage(UIImage(named:"heart_white"), for: .normal)
            petLiked = false
        }
        applyAccessibility()
    }

}

// MARK: Accessibility

extension PetDetailsViewController {
    func applyAccessibility(){
        
        if petLiked {
            petLikeButton.accessibilityLabel = "Liked"
            petLikeButton.accessibilityTraits = UIAccessibilityTraits.button
        } else {
            petLikeButton.accessibilityLabel = "Not Liked"
            petLikeButton.accessibilityTraits = UIAccessibilityTraits.button
        }
        contactButton.accessibilityHint = "Opens Mail"
    }
}
