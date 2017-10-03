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
	@IBOutlet weak var smallSize: UIButton!
	@IBOutlet weak var mediumSize: UIButton!
	
	@IBOutlet weak var heightLbl: UILabel!
	@IBOutlet weak var widthLbl: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		heightLbl.text = getScreenHeight().description
		widthLbl.text = getScreenWidth().description
		
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
		let nc = segue.destination as! UINavigationController
		let controller = nc.topViewController as! SelectImagesViewController
		if segue.identifier == "small" {
			
				controller.ticketSize = selectableSize.smallSize
				print(selectableSize.smallSize)
			
		}else {
		
				controller.ticketSize = selectableSize.mediumSize
				print(selectableSize.smallSize)
			
		}
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
