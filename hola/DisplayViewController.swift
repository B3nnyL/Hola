//
//  DisplayViewController.swift
//  hola
//
//  Created by Shuying Lin on 5/10/17.
//  Copyright © 2017 Shuying Lin. All rights reserved.
//

import UIKit
import CoreGraphics

class DisplayViewController: UIViewController {
	
	@IBOutlet weak var upImageView: UIImageView!
	
	@IBOutlet weak var rightImageView: UIImageView!
	
	@IBOutlet weak var downImageView: UIImageView!
	
	@IBOutlet weak var leftImageView: UIImageView!
	
	var imageSize: Int32?
	var data: NSData?
	let screenCenterX = UIScreen.main.bounds.width / 2
	let screenCenterY = UIScreen.main.bounds.height / 2
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//register gesture tap for toggle navigation bar
		self.navigationController?.hidesBarsOnTap = true
		UIScreen.main.brightness = 1
		
		self.view.backgroundColor = UIColor.black
		
		if let theData = data as Data?{
			upImageView.image = UIImage(data: theData)
		}
		
		if let size = imageSize {
			setImageViews(theSize: size)
		}
		
		if let image = upImageView.image{
			getImage(theImage: image)
		}

		if let size = imageSize {
			setImages(theSize: size)
		}
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.hidesBarsOnTap = false
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
	}
	

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
			// Dispose of any resources that can be recreated.
	}
	
	internal func getImage(theImage:UIImage){
		rightImageView.image = theImage
		downImageView.image = theImage
		leftImageView.image = theImage
	}
	
	internal func setImageViews(theSize:Int32?){
		let width = self.screenCenterX - CGFloat(theSize!) / 2
		let height = self.screenCenterY - CGFloat(theSize!)
		
		upImageView.frame = CGRect(x: width, y: height, width: CGFloat(theSize!), height: CGFloat(theSize!))
		rightImageView.frame = CGRect(x: width, y: height, width: CGFloat(theSize!), height: CGFloat(theSize!))
		downImageView.frame = CGRect(x: width, y: height, width: CGFloat(theSize!), height: CGFloat(theSize!))
		leftImageView.frame = CGRect(x: width, y: height, width: CGFloat(theSize!), height: CGFloat(theSize!))
	}
	
	internal func setImages(theSize:Int32?){
		rightImageView = upImageView.rotatingImage(target: rightImageView, direction: "right",xPos: CGFloat(theSize!),yPos: CGFloat(theSize!))
		downImageView = upImageView.rotatingImage(target: downImageView, direction: "down",xPos:0.0 ,yPos: CGFloat(theSize!)*2)
		leftImageView = upImageView.rotatingImage(target: leftImageView, direction: "left",xPos: -CGFloat(theSize!),yPos: CGFloat(theSize!))
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
