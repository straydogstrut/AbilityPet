//
//  PetTableViewController.swift
//  AbilityPet
//
//  Created by Daniel James Mclaughlan on 28/01/2019.
//  Copyright © 2019 AbilityNet. All rights reserved.
//

import UIKit

let backgroundImage = UIImageView(image: UIImage(named:"Background"))

class PetTableViewController: UITableViewController {
    
    //MARK: Properties
    var pets = [Pet]() // declare an empty array of Pet objects
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImage.contentMode = .scaleAspectFill
     //   tableView.backgroundView = backgroundImage
        loadSamplePets()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // table view cells are reused and should be dequeued using a cellIdentifier
        let cellIdentifier = "PetTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PetTableViewCell else {
            fatalError("The dequeued cell is not an instance of PetTableViewCell")
        }
        
        // fetches the appropriate pet
        let pet = pets[indexPath.row]
        
        cell.nameLabel.text = pet.name
        cell.photoImageView.image = pet.photo
        cell.locationLabel.text = pet.location
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    let petDetailSequeIdentifier = "showPetDetails"
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == petDetailSequeIdentifier {
            // Get the index path from the cell that was tapped
            let indexPath = tableView.indexPathForSelectedRow
            // Get the Row of the Index Path and set as index
            let index = indexPath?.row
            // Get in touch with the DetailViewController
            let detailViewController = segue.destination as! PetDetailsViewController
            // Pass on the data to the Detail ViewController by setting it's indexPathRow value
            detailViewController.petName = pets[index!].name
            detailViewController.petImage = pets[index!].photo!
            detailViewController.petDescription = pets[index!].description
            detailViewController.petStats = pets[index!].stats
        }
        
    }
    

    
    //MARK: Private Methods
    func loadSamplePets(){
        
       // get the array of dictionaries from the plist
        if let path = Bundle.main.path(forResource: "pets", ofType: "plist"){
            if let arrayOfPets = NSArray(contentsOfFile: path) as? [NSDictionary]{
                for dict in arrayOfPets {
                 
                    // grab the pet attributes from the dictionary
                    let petName = dict.object(forKey:"name") as! String
                    let petLocation = dict.object(forKey: "location") as! String
                    let photoString = dict.object(forKey:"photo") as! String
                    let petPhoto:UIImage? = UIImage(named: photoString) ?? UIImage(named:"noPetImage")
                    let petDesc = dict.object(forKey:"description") as! String
                    let petStats = dict.object(forKey:"stats") as! NSDictionary
                    
                    // populate the pets array with Pet objects
                    pets.append(Pet(name: petName, location: petLocation, photo: petPhoto, description: petDesc, stats: petStats)!)
                   
                  //   print(dict.object(forKey:"description") as! String)
                }
            }
        }
        
    }
 
}
