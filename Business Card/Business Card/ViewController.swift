//
//  ViewController.swift
//  Business Card
//
//  Created by Param Hooda on 18/01/20.
//  Copyright © 2020 Sirs. All rights reserved.
//

import UIKit
import CoreML
import Vision
import ImageIO

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    let model = facialRecognizer_1()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func takePhoto(sender: UIButton) {
        sender.isHidden = true
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            myImage.contentMode = .scaleToFill
            myImage.image = pickedImage
        }
        if let imageToAnalyse = myImage?.image {
            if let classLabelString = classLabel(forImage: imageToAnalyse) {
                categoryLabel.text = classLabelString
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func classLabel (forImage image:UIImage)-> String? {
        if let pixelBuffer = ImageProcessor.pixelBuffer(forImage: image.cgImage!) {
            guard let scene = try? model.prediction(image: pixelBuffer) else { fatalError("Unexpected runtime error") }
            return scene.classLabel
        }
        return nil
    }
    
    
    @IBAction func upload1(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            NSLog("Entered if statement")
            let imagePicker1 = UIImagePickerController()
            imagePicker1.delegate = self
            imagePicker1.sourceType = UIImagePickerController.SourceType.camera
            imagePicker1.allowsEditing = false
            NSLog("Image picker configured")
            self.present(imagePicker1, animated: true, completion: nil)
            NSLog("Presented")
        }
        
    }
    
}
    
    //func sceneLabel (forImage)



