//
//  CoolChoicesViewController.swift
//  Project1
//
//  Created by Alex Shockley on 9/13/23.
//

import UIKit

class CoolChoicesViewController: UIViewController {

    lazy var charModel = {
        return CharacterModel.sharedInstance()
    }()
    
    @IBOutlet weak var choices: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        choices.removeAllSegments()
        var numSegments = 0
        for val in charModel.getCoolChoices() {
            if let sval = val as? String {
                choices.insertSegment(withTitle: sval, at: numSegments, animated: true)
                numSegments += 1
            }
            
        }
        // Do any additional setup after loading the view.
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
