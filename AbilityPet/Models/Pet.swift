//
//  Pet.swift
//  AbilityPet
//
//  Created by Daniel James Mclaughlan on 28/01/2019.
//  Copyright © 2019 AbilityNet. All rights reserved.
//

import UIKit

class Pet {
    
    //MARK: Properties
    var name: String
    var type: String
    var location: String
    var photo: UIImage?
    var description : String
    var stats : NSDictionary
    
    //MARK: Initialisation
    init?(name: String, type: String, location: String, photo: UIImage?, description: String, stats: NSDictionary){
        // initialise stored properties
        self.name = name
        self.type = type
        self.location = location
        self.photo = photo
        self.description = description
        self.stats = stats
        
        // failsafe incase properties are empty
        if name.isEmpty {
            return nil
        } 
    }
}
