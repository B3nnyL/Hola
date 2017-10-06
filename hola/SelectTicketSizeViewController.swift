//
//  SelectTicketSizeViewController.swift
//  hola
//
//  Created by Shuying Lin on 2/10/17.
//  Copyright © 2017 Shuying Lin. All rights reserved.
//

import UIKit


class SelectTicketSizeViewController: UIViewController {
	
	var selectableSize = Image()
	var selected:Int32?
	
	@IBOutlet weak var smallBtn: UIButton!
	
	@IBAction func selectSmall(_ sender: Any) {
		selected = selectableSize.smallSize
		smallBtn.backgroundColor = UIColor.blue
	}
	
	@IBAction func selectMedium(_ sender: Any) {
		selected = selectableSize.mediumSize
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController?.hidesBarsOnTap = false
		
	}

	override func didReceiveMemoryWarning() {
			super.didReceiveMemoryWarning()
			// Dispose of any resources that can be recreated.
	}
	
	func  getScreenHeight() -> CGFloat {
		return UIScreen.main.bounds.size.height
	}
	
	func getScreenWidth() -> CGFloat {
		return UIScreen.main.bounds.size.width
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let controller = segue.destination as! SelectImagesViewController
		if segue.identifier == "size" {
				controller.ticketSize = selected
		}
	}
}
