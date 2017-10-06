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
			var height = Int(UIScreen.main.bounds.size.height / 4)
			var width = Int(UIScreen.main.bounds.size.width / 4)
//		var newPoint = CGPoint(x: height, y: width)
//		draw(CGRect(origin: newPoint, size: CGSize(width: 2, height: 2))
		
		if let theData = data as Data?{
			upImageView.image = UIImage(data: theData)
		}
		upImageView.frame = CGRect(x: height, y: width, width: Int(imageSize!), height: Int(imageSize!))
		downImageView.frame = CGRect(x: height, y: width, width: Int(imageSize!), height: Int(imageSize!))
		rightImageView.frame = CGRect(x: height, y: width, width: Int(imageSize!), height: Int(imageSize!))
		leftImageView.frame = CGRect(x: height, y: width, width: Int(imageSize!), height: Int(imageSize!))
		if let image = upImageView.image{
			getImage(theImage: image)
		}

		rightImageView = upImageView.rotatingImage(target: rightImageView, direction: "right")
		downImageView = upImageView.rotatingImage(target: downImageView, direction: "down")
		leftImageView = upImageView.rotatingImage(target: leftImageView, direction: "left")
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
