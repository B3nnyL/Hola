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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		UIScreen.main.brightness = 1
		let screenCenterX = UIScreen.main.bounds.width / 2
		let screenCenterY = UIScreen.main.bounds.height / 2
		self.view.backgroundColor = UIColor.black
		
		if let theData = data as Data?{
			upImageView.image = UIImage(data: theData)
		}
		
		let width = screenCenterX - CGFloat(imageSize!) / 2
		let height = screenCenterY - CGFloat(imageSize!)
		upImageView.frame = CGRect(x: width, y: height, width: CGFloat(imageSize!), height: CGFloat(imageSize!))
		rightImageView.frame = CGRect(x: width, y: height, width: CGFloat(imageSize!), height: CGFloat(imageSize!))
		downImageView.frame = CGRect(x: width, y: height, width: CGFloat(imageSize!), height: CGFloat(imageSize!))
		leftImageView.frame = CGRect(x: width, y: height, width: CGFloat(imageSize!), height: CGFloat(imageSize!))
		if let image = upImageView.image{
			getImage(theImage: image)
		}

		rightImageView = upImageView.rotatingImage(target: rightImageView, direction: "right",xPos: CGFloat(imageSize!),yPos: CGFloat(imageSize!))
		downImageView = upImageView.rotatingImage(target: downImageView, direction: "down",xPos:0 ,yPos: CGFloat(imageSize!)*2)
		leftImageView = upImageView.rotatingImage(target: leftImageView, direction: "left",xPos: -CGFloat(imageSize!),yPos: CGFloat(imageSize!))
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.navigationController?.isNavigationBarHidden = true
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
			// Dispose of any resources that can be recreated.
	}
	
	func getImage(theImage:UIImage){
		rightImageView.image = theImage
		downImageView.image = theImage
		leftImageView.image = theImage
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
