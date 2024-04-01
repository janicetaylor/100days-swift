//
//  ViewController.swift
//  Day59Challenge
//
//  Created by Janice on 3/28/24.
//

import UIKit

class ViewController: UITableViewController {
    
    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "personCellIdentifier", for: indexPath) as? PersonCell else {
            fatalError("can't dequeue cell")
        }
        
        let person = people[indexPath.row]
        cell.name.text = person.name
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")
    let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
        guard let data = data else { return }
        do {
            
        }
    }
    
    

    
}

