//
//  CharacterCreaterController.swift
//  Project1
//
//  Created by Alex Shockley on 9/9/23.
//

import UIKit

class CharacterCreaterController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,PortSelectionDelegate {
    
    @IBOutlet weak var characterName: UITextField!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var classTextField: UITextField!
    
    @IBOutlet weak var selectedPortImage: UIImageView!
    var classPickerView = UIPickerView()
    var selectedPortName = "port1"
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var armsLabel: UILabel!
    @IBOutlet weak var armsStepper: UIStepper!
    
    lazy var characterModel = {
        return CharacterModel.sharedInstance()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterName.delegate = self

        classTextField.inputView = classPickerView
        classPickerView.delegate = self
        classPickerView.dataSource = self
        
        print("We are in Character Creater Controller")
        // Do any additional setup after loading the view.
    }
    

    func didSelectProduct(image: UIImage,name:String) {
        self.selectedPortImage.image = image
        selectedPortName = name
        print(self.selectedPortName)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let loc = segue.destination as? PortSelectorController {
            loc.delegate = self
        }
        
    }
    
    @IBAction func sliderDidChange(_ sender: Any) {
        let heightVal = Int(heightSlider.value)
        let heightFt = Int(heightVal / 12)
        let heightIn = heightVal % 12
        heightLabel.text = "\(heightFt)'\(heightIn)\""
    }
    
    
    @IBAction func stepperDidChange(_ sender: Any) {
        armsLabel.text = "\(Int(armsStepper.value))"
    }
    
    
    @IBAction func tapDidCancel(_ sender: UITapGestureRecognizer) {
        self.characterName.resignFirstResponder()
        self.classTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.characterName.resignFirstResponder()
        return true
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.characterModel.getClassFor(row)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.characterModel.numberOfClasses()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.classTextField.text = self.characterModel.getClassFor(row)
    }
    
    @IBAction func didFinishCharacter(_ sender: Any) {
        self.characterModel.addCharacter(with: self.characterName.text!, self.selectedPortName)
//        self.navigationController?.pushViewController(nextViewController, animated: true)
//        self.navigationController?.pushViewController(CharactorEditor, animated: true)
        self.navigationController?.popViewController(animated: true)
//        self.navigationController?.popViewController(animated: false)
//        print("Made it past popViews")
//        performSegue(withIdentifier: "tableToChars", sender: nil)
        
    }
    
}
