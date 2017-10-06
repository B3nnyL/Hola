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

	var ticketSize: Int32?
	@IBOutlet weak var imageView: UIImageView!
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
	
	func showImage(preparedImage: UIImage) {
		imageView.image = preparedImage
		imageView.isHidden = false
		imageView.frame = CGRect(x: 100, y: 100, width: Int(ticketSize!), height: Int(ticketSize!))
		//CGAffineTransform works well, but it doesn't actually rotate the image
		imageView.image = preparedImage
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let nc = segue.destination as! UINavigationController
		let controller = nc.topViewController as! DisplayViewController
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
	func rotatingImage(target: UIImageView, direction: String) -> UIImageView{
		var height = UIScreen.main.bounds.size.height / 2
		var width = UIScreen.main.bounds.size.width / 2
		switch direction {
		case "up":
			target.transform =  rotateAroundCentralPoint(angle: CGFloat(Double.pi * 0 / 2), pointX: CGFloat(width), pointY: CGFloat(height))
		case "right":
			target.transform =  rotateAroundCentralPoint(angle: CGFloat(Double.pi * 1 / 2), pointX: CGFloat(width), pointY: CGFloat(height))
			print(target.center.x)
		case "down":
			target.transform =  rotateAroundCentralPoint(angle: CGFloat(Double.pi * 2 / 2), pointX: CGFloat(width), pointY: CGFloat(height))
			print(target.center.x)
		case "left":
			target.transform =  rotateAroundCentralPoint(angle: CGFloat(Double.pi * 3 / 2), pointX: CGFloat(width), pointY: CGFloat(height))
			print(target.center.x)
		default:
			target.transform =  rotateAroundCentralPoint(angle: CGFloat(Double.pi * 0 / 2), pointX: 0, pointY: 0)
		}
		return target
	}
	
	func rotateAroundCentralPoint(angle:CGFloat, pointX:CGFloat, pointY:CGFloat)-> CGAffineTransform{
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
