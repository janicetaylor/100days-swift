//
//  DetailViewController.swift
//  Project10
//
//  Created by Janice on 3/26/24.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailLabel.text = person.name
        self.detailImageView.image = UIImage(named: person.image)
    }
}
