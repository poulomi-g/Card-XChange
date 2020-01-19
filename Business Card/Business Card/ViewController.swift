//
//  ViewController.swift
//  Business Card
//
//  Created by Param Hooda on 18/01/20.
//  Copyright © 2020 Sirs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func takePhoto(sender: AnyObject) {
        NSLog("Calling button")
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            NSLog("Entered if statement")
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            NSLog("Image picker configured")
            self.present(imagePicker, animated: true, completion: nil)
            NSLog("Presented")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            myImage.contentMode = .scaleToFill
            myImage.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

