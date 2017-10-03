//
//  SelectImagesViewController.swift
//  hola
//
//  Created by Shuying Lin on 2/10/17.
//  Copyright © 2017 Shuying Lin. All rights reserved.
//

import UIKit

class SelectImagesViewController: UIViewController {
	
	var ticketSize: Int?
	@IBOutlet weak var imageView: UIImageView!
	var image: UIImage?
	@IBAction func takePhoto(_ sender: Any) {
		takePhoto(self)
	}
	
	@IBAction func selectFromLibrary(_ sender: Any) {
		choosePhotoFromLibrary()
	}
	override func viewDidLoad() {
			super.viewDidLoad()
		print(ticketSize!)
        // Do any additional setup after loading the view.
	}

	override func didReceiveMemoryWarning() {
			super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
	}
	
	func showImage(image: UIImage) {
		imageView.image = image
		imageView.isHidden = false
		imageView.frame = CGRect(x: 0, y: 0, width: ticketSize!, height: ticketSize!)
		print(ticketSize!)
	}
    

}

extension SelectImagesViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	
	func takePhotoWithCamera() {
		let imagePicker = UIImagePickerController()
		imagePicker.sourceType = .camera
		imagePicker.delegate = self
		imagePicker.allowsEditing = true
		present(imagePicker, animated: true, completion: nil)
	}
	
	func choosePhotoFromLibrary() {
		let imagePicker = UIImagePickerController()
		imagePicker.sourceType = .photoLibrary
		imagePicker.delegate = self
		imagePicker.allowsEditing = true
		present(imagePicker, animated: true, completion: nil)
	}
	
	func imagePickerController(_ picker: UIImagePickerController,
	                           didFinishPickingMediaWithInfo info: [String : Any]) {
		image = info[UIImagePickerControllerEditedImage] as? UIImage
		if let theImage = image {
			showImage(image: theImage)
		}
		dismiss(animated: true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
}
