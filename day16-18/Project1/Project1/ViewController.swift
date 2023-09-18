//
//  ViewController.swift
//  Project1
//
//  Created by Janice on 1/25/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        var items = try! fileManager.contentsOfDirectory(atPath: path)
        items = items.sorted()
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        print(pictures)
    
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = "Picture \(indexPath.row) of \(pictures.count)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            detailViewController.selectedImage = pictures[indexPath.row]
            detailViewController.selectedPicture = indexPath.row
            detailViewController.totalPictures = pictures.count
            navigationController?.pushViewController(detailViewController, animated: true)
        }
            
    }

}

