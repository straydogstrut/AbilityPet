//
//  WelcomeViewController.swift
//  AbilityPet
//
//  Created by Daniel James Mclaughlan on 28/01/2019.
//  Copyright © 2019 AbilityNet. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        displayInfoButton()
        
        // removes the default shadow image from the navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    func displayInfoButton(){
       
        // create the button
        let infoButton = UIButton()
        infoButton.setImage(UIImage(named: "info"), for: .normal)
        infoButton.layer.cornerRadius = 25
        infoButton.backgroundColor = UIColor(red:0.47, green:0.66, blue:0.26, alpha:1.0)
        infoButton.tintColor = UIColor(red:0.47, green:0.66, blue:0.26, alpha:0.5)
        infoButton.addTarget(self, action: #selector(showInfoModal), for: .touchUpInside)
        
        self.view.addSubview(infoButton)
        
        // info button constraints
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        infoButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    }
    
    @objc func showInfoModal(sender: UIButton!) {
        print("Button tapped")
      
        let modalInfoViewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "infoModalViewController") as UIViewController
        
        self.present(modalInfoViewController, animated: true, completion: nil)
        
    }
}

extension WelcomeViewController {
    func applyAccessibility(){
        // apply accessibility code here
        
    }
}
