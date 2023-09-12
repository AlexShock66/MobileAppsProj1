//
//  CharactorEditor.swift
//  Project1
//
//  Created by Alex Shockley on 9/5/23.
//

import UIKit

private let reuseIdentifier = "character"

class CharactorEditor: UICollectionViewController {
    
    lazy var characterModel = {
        return CharacterModel.sharedInstance()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CharAvatarViewController,
           let cell = sender as? CollectCell{
            vc.imageToDisplay = cell.imageView.image!
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print("Num characters: \(self.characterModel.numberOfCharacters())")
        
        return self.characterModel.numberOfCharacters()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectCell{
//            if let name = self.characterModel.getPortName(for: indexPath.row) as? String {
//                cell.imageView.image = self.characterModel.getPortWithName(name)
//            }
//            return cell
//        } else {
//            fatalError("Couldnt deque cell in characterEditor")
//        }
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectCell {
            if let char = self.characterModel.getCharacterWith(indexPath.row) as? NSDictionary{
                let charName = char["name"]
                let portName = char["avatar"]
                cell.imageView.image = self.characterModel.getPortWithName(portName as! String)
                cell.charName.text = charName as! String
                return cell

            } else {
                fatalError("Could not convert char to dictionary in charactorEditor")
            }
        } else {
            fatalError("Could not deque cell in charactorEditor")
        }
        // Configure the cell
    
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
