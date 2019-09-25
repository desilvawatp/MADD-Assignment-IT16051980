//
//  SellerAddItemViewController.swift
//  it16051980
//
//  Copyright © 2019 Tharushi De Silva. All rights reserved.
//

import UIKit

class SellerAddItemViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var disc: UITextView!
    
    let picker = UIImagePickerController()
    
    // get from photos
    @IBAction func onUploadClick(_ sender: Any) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    
    // set photo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            img.contentMode = .scaleAspectFit
            img.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
    // when cancled
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // get all inputs.
    @IBAction func onAddItemBtnClick(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
}
