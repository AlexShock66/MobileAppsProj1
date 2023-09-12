//
//  InventoryViewController.swift
//  Project1
//
//  Created by Alex Shockley on 9/10/23.
//

import UIKit

class InventoryViewController: UITableViewController {

    @IBOutlet weak var timeSpentLabel: UILabel!
    
    
    private var timer: Timer?
    
    lazy var characterModel = {
        return CharacterModel.sharedInstance()
    }()
    
    var secondsWasted = 0
    @objc func timerDidUpdate(timer:Timer) {
        secondsWasted += Int(timer.timeInterval)
        timeSpentLabel.text = "Seconds Wasted in Inventory: \(secondsWasted)"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                         target:self,
                                         selector:#selector(timerDidUpdate),
                                         userInfo: nil,
                                         repeats:true
        )
        // Uncomment the following line to preserve selecttargetion between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section{
        case 0: //weapons
            return self.characterModel.numberOfWeapons()
        case 1: //armors
            return self.characterModel.numberOfArmors()
        case 2:
            return self.characterModel.numberOfCybernetics()
        default:
            return 0
            
        }
    
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0://weapons
            let cell = tableView.dequeueReusableCell(withIdentifier: "weapons", for: indexPath)
            
            // Configure the cell...
            if let weaponName = self.characterModel.getWeaponWith(indexPath.row)["name"] as? String,
               let weaponImageName = self.characterModel.getWeaponWith(indexPath.row)["imageName"] as? String{
                cell.textLabel!.text = weaponName
                cell.imageView?.image = characterModel.getWeaponImage(for: weaponImageName)
                print("WeaponName: \(weaponImageName)")
            }
            return cell
        case 1://armors
            let cell = tableView.dequeueReusableCell(withIdentifier: "armors", for: indexPath)

            if let armorName = self.characterModel.getArmorWith(indexPath.row)["name"] as? String,
               let armorValue = self.characterModel.getArmorWith(indexPath.row)["defence_amt"] as? Int{
                cell.textLabel!.text = armorName
                cell.detailTextLabel!.text = "\(armorValue) armor"
    
            }

            return cell
        case 2://cyberware
            let cell = tableView.dequeueReusableCell(withIdentifier: "cyberwares", for: indexPath)
            if let cyberwareName = self.characterModel.getCyberneticWith(indexPath.row) as? String {
                cell.textLabel!.text = cyberwareName
    
            }
            // Configure the cell...

            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

            // Configure the cell...

            return cell
        }
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
