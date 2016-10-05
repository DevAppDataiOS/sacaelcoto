//
//  SacaElCotoTableViewController.swift
//  Saca el coto
//
//  Created by Alfredo Fregoso on 9/7/16.
//  Copyright © 2016 AppData. All rights reserved.
//

import UIKit
import Parse



class SacaElCotoTableViewController: UITableViewController {
    
    
   
    var indexSelected = IndexPath();
    //var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "PetiteOyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh'sChocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats","Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina","Donostia", "Royal Oak", "Thai Cafe"]
   
    var restaurantNames = ["La boquita", "Barezzito"]
//var restaurantImages = ["barrafina.jpg","confessional.jpg"]
    var placesArray = [PFObject]()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        let query = PFQuery(className:"Places")
        query.findObjectsInBackground { (objects, error) in
            
            
            
            if error == nil {
                
                // The find succeeded.
                self.placesArray = objects!
                self.tableView.reloadData()
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        print(object.objectId)
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error)")
            }

        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 203
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell  {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                 for: indexPath as IndexPath) as! SacaElCotoTableViewCell
        
        let object = placesArray[indexPath.row]
        
        
        
        
        
        
        cell.nameLabel.text = object["name"] as? String
        cell.locationLabel.text = object["direction"] as? String
        cell.typeLabel.text =  object["description"] as? String
        //cell.thumbnailImageView.image = object["image"] as? String
        
        let placeImage = object["image"] as! PFFile
        placeImage.getDataInBackground { (data, error) in
            
            if error == nil {
                if let imageData = data {
                    cell.thumbnailImageView.image = UIImage(data: imageData)
                }
            }
        }
        
        
        return cell }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return placesArray.count
    }

   //MARK: table view delegates
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected = indexPath
        
        self.performSegue(withIdentifier: "showPlaceDetail", sender: nil)
        
    }
    
    
    // MARK: - Table view data source

   // override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //return 0
    //}

    //override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       // return 0
   // }

    
   /* override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
       
    
        // Configure the cell...

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




}*/
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.description == "showPlaceDetail"{
            let controller = segue.destination as! SacaElCotoDetailViewController
            //let IndexPath = self.tableView.indexPathForSelectedRow
            let object = placesArray[indexSelected.row]
            
            controller.titleString =  (object["name"] as? String)!
        }
      
     }
    
}
