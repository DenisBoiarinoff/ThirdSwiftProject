//
//  MainViewController.swift
//  ThirdSwiftProject
//
//  Created by Rhinoda3 on 13.07.16.
//  Copyright © 2016 Rhinoda. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func login(sender: AnyObject) {
		let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		appDelegate.window?.rootViewController = appDelegate.tabBarController
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
