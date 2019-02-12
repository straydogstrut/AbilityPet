//
//  PetTableViewController.swift
//  AbilityPet
//
//  Created by Daniel James Mclaughlan on 28/01/2019.
//  Copyright © 2019 AbilityNet. All rights reserved.
//

import UIKit


class PetTableViewController: UITableViewController {
    
    // MARK: Properties
    let backgroundImage = UIImageView(image: UIImage(named:"Background"))
    var allPets = [Pet]() // declare an empty array of Pet objects
    var filteredPets = [Pet]()
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func segmentValueChanged(_ sender: Any) {
        
        // filter table data depending on segment selected
        if segmentedControl.selectedSegmentIndex == 1 {
            filteredPets = allPets.filter{ $0.type.contains("Cat") }
        } else if segmentedControl.selectedSegmentIndex == 2 {
            filteredPets = allPets.filter { $0.type.contains("Dog")}
        } else {
            filteredPets = allPets
        }
    
        self.tableView.reloadData()
        applyAccessibility()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImage.contentMode = .scaleAspectFill
        
        loadPetsFromPlist()
        filteredPets = allPets // show all pets by default
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return filteredPets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // table view cells are reused and should be dequeued using a cellIdentifier
        let cellIdentifier = "PetTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PetTableViewCell else {
            fatalError("The dequeued cell is not an instance of PetTableViewCell")
        }
        
        // fetches the appropriate pet
        let pet = filteredPets[indexPath.row]
        
        cell.nameLabel.text = pet.name
        cell.photoImageView.image = pet.photo
        cell.locationLabel.text = pet.location
        
        // mark the second cell as a new arrival for demo purposes
       
        if indexPath.row == 1 {
            cell.newArrivalLabel.isHidden = false
        } else {
            cell.newArrivalLabel.isHidden = true
        }
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let petDetailSequeIdentifier = "showPetDetails"
        
        if segue.identifier == petDetailSequeIdentifier {
            // Get the index path from the cell that was tapped
            let indexPath = tableView.indexPathForSelectedRow
            // Get the Row of the Index Path and set as index
            let index = indexPath?.row
            // Get the new view controller using segue.destination
            let detailViewController = segue.destination as! PetDetailsViewController
            // Pass on the data to the Detail ViewController
            detailViewController.petName = filteredPets[index!].name
            detailViewController.petImage = filteredPets[index!].photo!
            detailViewController.petDescription = filteredPets[index!].description
            detailViewController.petStats = filteredPets[index!].stats
        }
        
    }
    
    
    // MARK: Private Methods
    func loadPetsFromPlist(){
        
       // get the array of dictionaries from the plist
        if let path = Bundle.main.path(forResource: "pets", ofType: "plist"){
            if let arrayOfPets = NSArray(contentsOfFile: path) as? [NSDictionary]{
                for dict in arrayOfPets {
                 
                    // grab the pet attributes from the dictionary
                    let petName = dict.object(forKey:"name") as! String
                    let petType = dict.object(forKey: "type") as! String
                    let petLocation = dict.object(forKey: "location") as! String
                    let photoString = dict.object(forKey:"photo") as! String
                    let petPhoto:UIImage? = UIImage(named: photoString) ?? UIImage(named:"noPetImage")
                    let petDesc = dict.object(forKey:"description") as! String
                    let petStats = dict.object(forKey:"stats") as! NSDictionary
                    
                    // populate the pets array with Pet objects
                    allPets.append(Pet(name: petName, type: petType, location: petLocation, photo: petPhoto, description: petDesc, stats: petStats)!)
                }
            }
        }
        
    }
 
}

// MARK: Accessibility
extension PetTableViewController {
    func applyAccessibility(){
        // apply accessibility code here
        
    }
}
