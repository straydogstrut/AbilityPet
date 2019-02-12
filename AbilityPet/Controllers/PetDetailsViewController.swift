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
    
    @IBOutlet weak var petGenderTitle: UILabel!
    @IBOutlet weak var petGenderLabel: UILabel!
    @IBOutlet weak var genderStatView: UIView!
    
    @IBOutlet weak var petBreedTitle: UILabel!
    @IBOutlet weak var petBreedLabel: UILabel!
    
    @IBOutlet weak var petAgeTitle: UILabel!
    @IBOutlet weak var petAgeLabel: UILabel!
    
    @IBOutlet weak var petStatsTextView: UITextView!
    
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var alertButton: UIButton!
    
    @IBAction func askButtonTouched(_ sender: UIButton) {
        
        if let url = URL(string: "http://www.abilitynet.org.uk") {
            UIApplication.shared.open(url, options: [:])
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        applyAccessibility()
    }
    
    
    
   // MARK: Private methods
    func setupView(){
        petImageView.isAccessibilityElement = true
        petImageView.image = petImage
        petLiked(false)
        petNameLabel.text = "Hi, I'm " + (petName)
        petDescriptionTextView.text = petDescription
        
        petGenderLabel.text = (petStats.object(forKey: "gender") as! String)
        petBreedLabel.text = (petStats.object(forKey: "breed") as! String)
        petAgeLabel.text = (petStats.object(forKey: "age") as! String)
        
        
        // randomise alert button for the purposes of this example
        let showAlertButton = Bool.random()
        
        if showAlertButton {
            alertButton.isHidden = true
        } else {
            alertButton.isHidden = false
        }
    }
    
    func petLiked(_ liked: Bool){
        if liked {
            petLikeButton.setImage(UIImage(named:"heart_red"), for: .normal)
            petLiked = true
        } else {
            petLikeButton.setImage(UIImage(named:"heart_white"), for: .normal)
            petLiked = false
        }
    }
}



// MARK: Accessibility

extension PetDetailsViewController {
    func applyAccessibility(){
    
        
    }
 
}
