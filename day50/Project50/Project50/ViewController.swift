//
//  ViewController.swift
//  Project50
//
//  Created by Janice on 4/5/22.
//

import UIKit
import Photos
import PhotosUI

class ViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, PHPickerViewControllerDelegate {
    
    var captions = [CameraCaption]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(CameraCaptionCell.self, forCellReuseIdentifier: "CameraCaptionCell")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openPhotoLibrary))
    }
    
    @objc func openCaptionAlert(selectedImage :UIImage) {
        let alertController = UIAlertController(title: "Add caption", message: "", preferredStyle: .alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Enter caption"
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
                let firstTextField = alertController.textFields![0] as UITextField
                
                let caption: CameraCaption = CameraCaption(caption: firstTextField.text as! String, image: selectedImage as! UIImage)
                self.captions.append(caption)
              
            })
        
        alertController.addAction(saveAction)
        present(alertController, animated: true)
    }
    
    @objc func openPhotoLibrary() {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 1
        config.filter = .images
        
        let pickerViewController = PHPickerViewController(configuration: config)
        pickerViewController.delegate = self
        present(pickerViewController, animated: true)
       
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
                
        let itemProvider = results.first?.itemProvider

        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { [self]  image, error in
                    if let image = image {
                        let caption = CameraCaption(caption: "Unknown", image: image as! UIImage)
                        self.captions.append(caption)
                
                     }
            }
        }
       
        self.tableView.reloadData()
        picker.dismiss(animated: true)
        
    }
    
    func save() {
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: captions, requiringSecureCoding: false) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "captions")
        }
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else { return }

        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)

        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return captions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CameraCaptionCell", for: indexPath) as? CameraCaptionCell else {
            fatalError("Unable to dequeue CameraCaptionCell.")
        }
        
        let caption = captions[indexPath.item]
        cell.captionLabel.text = caption.caption
        cell.cameraImageView.image = caption.image

        cell.cameraImageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.cameraImageView.layer.borderWidth = 2
        cell.cameraImageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // selected a row
    }

}

