//
//  HomeViewController.swift
//  ThirdSwiftProject
//
//  Created by Rhinoda3 on 14.07.16.
//  Copyright © 2016 Rhinoda. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

	@IBOutlet weak var statusLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var ageLabel: UILabel!

	@IBOutlet weak var avatarView: UIImageView!
	
	var profile: Profile? = nil

	// MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		let profileInfo  = NSUserDefaults.standardUserDefaults()
		profileSetting(profileInfo)
		prepareViewToShow();
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	// MARK: - Optional Functions

	func prepareViewToShow() -> Void {
		if profile?.name != nil {
			nameLabel.text = profile?.name
		} else {
			nameLabel.text = ""
		}
		if profile?.email != nil {
			emailLabel.text = profile?.email
		} else {
			emailLabel.text = ""
		}
		if profile?.age != nil {
			ageLabel.text = "\((profile?.age)!)"
		} else {
			ageLabel.text = " "
		}
		if profile?.status != nil {
			statusLabel.text = profile?.status
		} else {
			statusLabel.text = "Online"
		}
		if profile?.avatar != nil {
			avatarView.image = profile?.avatar
		} else {
			avatarView.image = UIImage(named: "photo-350x350")
		}
	}

	func profileSetting(profileInfo: NSUserDefaults) -> Void {



		profile = Profile()
		profile?.name = profileInfo.objectForKey("name") as? String
		profile?.email = profileInfo.objectForKey("email") as? String
		profile?.age = profileInfo.objectForKey("age") as? Int
		profile?.status = profileInfo.objectForKey("status") as? String
		let imgData = profileInfo.objectForKey("avatar") as? NSData
		if imgData != nil {
			let img = UIImage(data: imgData!)
			profile?.avatar = img
		}
		print("Home")
		print(profile?.name)
		print(profile?.email)
		print(profile?.age)
		print(profile?.status)
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
