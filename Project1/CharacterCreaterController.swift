//
//  CharacterCreaterController.swift
//  Project1
//
//  Created by Alex Shockley on 9/9/23.
//

import UIKit

class CharacterCreaterController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var characterName: UITextField!
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var armsLabel: UILabel!
    @IBOutlet weak var armsStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterName.delegate = self
        characterName.becomeFirstResponder()
        print("We are in Character Creater Controller")
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
    @IBAction func sliderDidChange(_ sender: Any) {
        let heightVal = Int(heightSlider.value)
        let heightFt = Int(heightVal / 12)
        let heightIn = heightVal % 12
        heightLabel.text = "\(heightFt)'\(heightIn)\""
    }
    
    
    @IBAction func stepperDidChange(_ sender: Any) {
        armsLabel.text = "\(Int(armsStepper.value))"
    }
    
}
