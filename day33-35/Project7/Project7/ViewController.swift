//
//  ViewController.swift
//  Project7
//
//  Created by Janice on 9/18/23.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()
    var filteredPetitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let credits = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(ViewController.barButtonItemSelected))
        self.navigationItem.rightBarButtonItem = credits
        
        let filteredButton = UIBarButtonItem(title: "Filter Results", style: .plain, target: self, action: #selector(ViewController.filterButtonItemSelected))
        self.navigationItem.leftBarButtonItem = filteredButton
        
        let urlString :String
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
       
        guard let url = URL(string: urlString) else {
            print("invalid url")
            return
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
               parse(json: data)
            } else {
                showError()
            }
        } else {
            showError()
        }
        
    }
    
    @objc func filterButtonItemSelected() {
        let alertController = UIAlertController(title: "Filter messages", message: "Enter title keyword to filter by:", preferredStyle: .alert)
        alertController.addTextField()
        
        let filterAction = UIAlertAction(title: "Filter", style: .default) {
            [weak self, weak alertController] _ in
            guard let filterWord = alertController?.textFields?[0].text else { return }
            self?.showPetitions(for: filterWord)
        }
        
        alertController.addAction(filterAction)
        self.parent!.present(alertController, animated: true)
    }
    
    func showPetitions(for filter: String) {
        filteredPetitions.removeAll()
        
            for petition in petitions {
                if petition.title.contains(filter) {
                    filteredPetitions.append(petition)
                }
            }
        
            tableView.reloadData()
    }
    
    @objc func barButtonItemSelected() {
        let alertController = UIAlertController(title: "Credits", message: "this data is from the We the People API", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.parent!.present(alertController, animated: true)
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading Error", message: "Problem loading feed", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        self.parent!.present(ac, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            filteredPetitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = filteredPetitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = filteredPetitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    

}

