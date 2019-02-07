//
//  ModalViewController.swift
//  AbilityPet
//
//  Created by Daniel James Mclaughlan on 01/02/2019.
//  Copyright © 2019 AbilityNet. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var aboutText: UITextView!
    @IBAction func dismissModal(_ sender: Any) {
        /*
        if let url = URL(string: "http://www.abilitynet.org.uk") {
            UIApplication.shared.open(url, options: [:])
        }
        */
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let aboutString = "AbilityPet specialises in finding forever homes for our four legged friends. \n\n We have centres across the country and our staff regularly make home visits to see how our previous residents are settling in to their new homes. \n\n We can offer advice on everything from caring for your new pet, registering with local vets, arranging pet insurance, and even where to find pet-friendly holidays. \n\n If you're looking to make a new friend, take a look at our listings to find out more and arrange a visit. More information about our services can be found here"
        
        let aboutAttribute = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0)]
        let attributedString = NSMutableAttributedString(string: aboutString, attributes: aboutAttribute)
        
        attributedString.addAttribute(.link, value: "http://www.abilitynet.org.uk/", range: NSRange(location: 551, length: 4))
        
        aboutText.attributedText = attributedString
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL, options: [:])
        return false
    }
}

// MARK: Accessibility

extension ModalViewController {
    func applyAccessibility(){
        
    }
}
