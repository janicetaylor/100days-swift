//
//  DetailViewController.swift
//  Project1
//
//  Created by Janice on 1/25/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedPicture: Int = 0
    var totalPictures: Int = 0 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \(selectedPicture) of \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
}
