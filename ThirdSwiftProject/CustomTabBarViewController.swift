//
//  CustomTabBarViewController.swift
//  ThirdSwiftProject
//
//  Created by Rhinoda3 on 13.07.16.
//  Copyright © 2016 Rhinoda. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

		let homeController: HomeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
		let item1 = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
		item1.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFontOfSize(10)], forState: .Normal)
		homeController.tabBarItem = item1
		let aboutController: AboutViewController = AboutViewController(nibName: "AboutViewController", bundle: nil)
		let item2 = UITabBarItem(title: "About", image: UIImage(named: "camera"), tag: 1)
		item2.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFontOfSize(10)], forState: .Normal)
		aboutController.tabBarItem = item2
		let settingsController: SettingsViewController = SettingsViewController(nibName: "SettingsViewController", bundle: nil)
		let item3 = UITabBarItem(title: "Settings", image: UIImage(named: "flag"), tag: 2)
		item3.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFontOfSize(10)], forState: .Normal)
		settingsController.tabBarItem = item3
		let contactsController: ContactsViewController = ContactsViewController(nibName: "ContactsViewController", bundle: nil)
		let item4 = UITabBarItem(title: "Contacts", image: UIImage(named: "contacts"), tag: 3)
		item4.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFontOfSize(10)], forState: .Normal)
		contactsController.tabBarItem = item4

		tabBar.tintColor = UIColor.whiteColor()

		let selectedIndecator = UIImage(named:  "select_indecator")
		let size = CGSizeApplyAffineTransform(selectedIndecator!.size, CGAffineTransformMakeScale(0.7, 0.5))
		UIGraphicsBeginImageContext(size)
		selectedIndecator!.drawInRect(CGRect(origin: CGPointZero, size: size))
		let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()

		tabBar.selectionIndicatorImage = scaledImage

		setViewControllers([homeController, contactsController, settingsController, aboutController], animated: false)

		UIGraphicsBeginImageContext(tabBar.frame.size)
		UIColorFromRGB(0x232324).setFill()
		CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, tabBar.frame.size.width, tabBar.frame.size.height));
		let img = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()

		tabBar.backgroundImage = img

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	// MARK: - Optional Functions

	func UIColorFromRGB(rgbValue: UInt) -> UIColor {
		return UIColor(
			red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
			green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
			blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
			alpha: CGFloat(1.0)
		)
	}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
