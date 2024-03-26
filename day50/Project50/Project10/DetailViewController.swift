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
        
        let path = getDocumentsDirectory().appendingPathComponent(person.image)
        self.detailLabel.text = person.name
        self.detailImageView.image = UIImage(contentsOfFile: path.path)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
