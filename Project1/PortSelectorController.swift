//
//  PortSelectorController.swift
//  Project1
//
//  Created by Alex Shockley on 9/9/23.
//

import UIKit

private let reuseIdentifier = "portCell"

protocol PortSelectionDelegate {
    func didSelectProduct(image:UIImage,name:String)
}
class PortSelectorController: UICollectionViewController {
    lazy var charModel = {
        return CharacterModel.sharedInstance()
    }()
    
    var delegate: PortSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Loaded")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Number of Ports \(self.charModel.numberOfPorts())")
        // #warning Incomplete implementation, return the number of items
        return charModel.numberOfPorts()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectCell {
            if let name = self.charModel.getPortName(for:indexPath.row) as? String {
                print(name)
                cell.imageView.image = self.charModel.getPortWithName(name)
            }
            print("Outside if let")
            return cell
        } else {
            fatalError("Could not dequeue Cell")
        }
        
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected image at \(indexPath.row)")
        self.delegate?.didSelectProduct(image: self.charModel.getPortWith(indexPath.row),name:self.charModel.getPortName(for: indexPath.row))
        self.dismiss(animated: true)
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

    
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
//    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
//        return false
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
//        return true
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    @IBAction func didPressCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    //        print("Selected image at \(indexPath.row)")
//
//    }
    

}
