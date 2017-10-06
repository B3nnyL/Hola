//
//  SelectImagesViewController.swift
//  hola
//
//  Created by Shuying Lin on 2/10/17.
//  Copyright © 2017 Shuying Lin. All rights reserved.
//

import UIKit
import CoreGraphics

class SelectImagesViewController: UIViewController {

	@IBOutlet weak var InstructionLbl: UILabel!
	var ticketSize: Int32?
	@IBOutlet weak var imageView: UIImageView!
	@IBAction func takePhoto(_ sender: Any) {
		takePhoto(self)
	}

	@IBAction func selectFromLibrary(_ sender: Any) {
		choosePhotoFromLibrary()
	}
	
	let screenCenterX = UIScreen.main.bounds.width / 2
	let screenCenterY = UIScreen.main.bounds.height / 2
	
	override func viewDidLoad() {
			super.viewDidLoad()
			print(ticketSize!)
			self.navigationController?.hidesBarsOnTap = false
        // Do any additional setup after loading the view.
		if imageView.image == nil {
			self.navigationItem.rightBarButtonItem?.isEnabled = false
		} else{
			self.navigationItem.rightBarButtonItem?.isEnabled = true
		}
		
	}

	override func didReceiveMemoryWarning() {
			super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
	}
	
	func showImage(preparedImage: UIImage) {
		imageView.image = preparedImage
		imageView.isHidden = false
		imageView.frame = CGRect(x: screenCenterX, y: screenCenterY, width: CGFloat(ticketSize!), height: CGFloat(ticketSize!))
		//CGAffineTransform works well, but it doesn't actually rotate the image
		imageView.image = preparedImage
		self.navigationItem.rightBarButtonItem?.isEnabled = true
		InstructionLbl.text = "For Better Experience, please start your experience in a dark environment"
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let controller = segue.destination as! DisplayViewController
		if segue.identifier == "finish" {
			controller.imageSize = ticketSize
			if let theImage = self.imageView.image{
				let data = UIImagePNGRepresentation(theImage) as NSData?
				controller.data = data
			}
		}
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
		imageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
		if let theImage = imageView.image {
			showImage(preparedImage: theImage)
		}
		dismiss(animated: true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
	
}

extension UIImageView {
	func rotatingImage(target: UIImageView, direction: String,xPos: CGFloat, yPos: CGFloat) -> UIImageView{
		switch direction {
		case "up":
			target.transform =  CGAffineTransform(rotationAngle: CGFloat(Double.pi * 0 / 2)).concatenating(CGAffineTransform(translationX: xPos, y: yPos))
		case "right":
			target.transform =  CGAffineTransform(rotationAngle: CGFloat(Double.pi * 1 / 2)).concatenating(CGAffineTransform(translationX: xPos, y: yPos))
			print(target.center.x)
		case "down":
			target.transform =  CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2 / 2)).concatenating(CGAffineTransform(translationX: xPos, y: yPos))
			print(target.center.x)
		case "left":
			target.transform =  CGAffineTransform(rotationAngle: CGFloat(Double.pi * 3 / 2)).concatenating(CGAffineTransform(translationX: xPos, y: yPos))
			print(target.center.x)
		default:
			target.transform =  CGAffineTransform(rotationAngle: CGFloat(Double.pi * 0 / 2)).concatenating(CGAffineTransform(translationX: xPos, y: yPos))
		}
		return target
	}
	
	func rotateAroundExternalPoint(angle:CGFloat, pointX:CGFloat, pointY:CGFloat)-> CGAffineTransform{
		return CGAffineTransform(a: cos(angle), b: sin(angle), c: -sin(angle), d: cos(angle),
		                         tx: pointX-pointX*cos(angle)+pointY*sin(angle), ty: pointY-pointX*sin(angle)-pointY*cos(angle))
	}
	func resizeImage(target: UIImageView, originSize: CGFloat, targetSize: CGFloat) -> UIImageView{
		let ratio = targetSize / originSize
		target.transform = CGAffineTransform(scaleX: ratio,y: ratio)
		return target
	}
	
	func translateImage(target: UIImageView, xPos: CGFloat, yPos: CGFloat) -> UIImageView{
		target.transform = CGAffineTransform(translationX: xPos, y: yPos)
		return target
	}
}
