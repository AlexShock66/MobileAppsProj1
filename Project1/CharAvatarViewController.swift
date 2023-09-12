//
//  CharAvatarViewController.swift
//  Project1
//
//  Created by Alex Shockley on 9/12/23.
//

import UIKit

class CharAvatarViewController: UIViewController,UIScrollViewDelegate {
    lazy var imageModel = {
        return CharacterModel.sharedInstance()
    }()
    
    lazy private var imageView: UIImageView? = {
        return UIImageView.init(image: imageToDisplay)
    }()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageToDisplay = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let size = self.imageView?.image?.size{
            self.scrollView.addSubview(self.imageView!)
            self.scrollView.contentSize = size
            self.scrollView.minimumZoomScale = 0.1
            self.scrollView.delegate = self
        }
        // Do any additional setup after loading the view.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
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
