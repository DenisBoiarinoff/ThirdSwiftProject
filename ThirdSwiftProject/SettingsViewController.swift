//
//  SettingsViewController.swift
//  ThirdSwiftProject
//
//  Created by Rhinoda3 on 13.07.16.
//  Copyright © 2016 Rhinoda. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!

	@IBOutlet weak var ageLabel: UILabel!

	@IBOutlet weak var nameAccessSwitch: UISwitch!
	@IBOutlet weak var emailAccessSwitch: UISwitch!

	@IBOutlet weak var ageSpiner: UIStepper!

	@IBOutlet weak var statusSelecter: UISegmentedControl!

	@IBOutlet weak var accountImg: UIImageView!

	var imagePicker: UIImagePickerController? = UIImagePickerController()

	var profile: Profile? = nil

	// MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

		imagePicker?.delegate = self

		let parentBounds = UIScreen.mainScreen().bounds
		let parentHeidht = parentBounds.size.height

		let font = UIFont(name: "Arial", size: parentHeidht * 0.0195)
		let dictionary: NSDictionary = NSDictionary(object: font!, forKey: NSFontAttributeName)

		statusSelecter.setTitleTextAttributes(dictionary as [NSObject : AnyObject], forState: .Normal)
        // Do any additional setup after loading the view.
    }

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		let profileInfo  = NSUserDefaults.standardUserDefaults()
		profileSetting(profileInfo)
		prepareViewToShow();
	}

//	override func view

	override func viewWillDisappear(animated: Bool) {
		switchOffEmailAcess()
		switchOffNameAcess()

		super.viewWillDisappear(animated)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	// MARK: - Textfield Delegate

	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		switchOffNameAcess()
		switchOffEmailAcess()
		return true
	}

	// MARK: - Switch Actions

	@IBAction func switchNameFieldEditable(sender: AnyObject) {
		nameTextField.enabled = nameAccessSwitch.on
		switchOffEmailAcess()
	}
	
	@IBAction func switchEmailFieldEditable(sender: AnyObject) {
		emailTextField.enabled = emailAccessSwitch.on
		switchOffNameAcess()
	}

	// MARK: - Spiner Action

	@IBAction func changeAge(sender: AnyObject) {
		let stepper = sender as? UIStepper
		ageLabel.text = "Your age is \(Int((stepper?.value)!))"
		profile?.age = Int((stepper?.value)!)
	}

	// MARK: - Multy Button Ction

	@IBAction func changeStatus(sender: AnyObject) {
		let status = sender as? UISegmentedControl
		let int = status?.selectedSegmentIndex
		profile?.status = status?.titleForSegmentAtIndex(int!)
	}

	// MARK: - Button Actons

	@IBAction func selectAccountImage(sender: AnyObject) {
		imagePicker?.allowsEditing = false
		imagePicker?.sourceType = .PhotoLibrary

		presentViewController(imagePicker!, animated: true, completion: nil)
	}

	@IBAction func saveChanges(sender: AnyObject) {

		profile?.name = nameTextField.text
		profile?.email = emailTextField.text

		saveProfile()

	}

	// MARK: - Image Picker Controller Delegate

	func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
		if let pickedImg = info[UIImagePickerControllerOriginalImage] as? UIImage {
			self.accountImg.contentMode = .ScaleAspectFit
			profile?.avatar = pickedImg
			saveProfile()
//			self.accountImg.image = profile?.avatar
//			self.accountImg.image = pickedImg

		}
		dismissViewControllerAnimated(true, completion: nil)
	}

	func imagePickerControllerDidCancel(picker: UIImagePickerController) {
		dismissViewControllerAnimated(true, completion: nil)
	}

	// MARK: - Optional Functions

	func saveProfile() -> Void {
		print(profile?.name)
		print(profile?.email)
		print(profile?.age)
		print(profile?.status)

		var data: NSData = NSData()
		if profile?.avatar != nil {
			data = UIImageJPEGRepresentation(profile!.avatar! , 100)!

		}

		let deft = NSUserDefaults.standardUserDefaults()

		deft.setObject(profile?.name, forKey: "name")
		deft.setObject(profile?.email, forKey: "email")
		deft.setObject(profile?.age, forKey: "age")
		deft.setObject(profile?.status, forKey: "status")
		deft.setObject(data, forKey: "avatar")

		deft.synchronize()
	}

	func prepareViewToShow() -> Void {

		if profile?.name != nil {
			nameTextField.text = profile?.name
		} else {
			nameTextField.text = ""
		}
		if profile?.email != nil {
			emailTextField.text = profile?.email
		} else {
			emailTextField.text = ""
		}
		if profile?.age != nil {
			ageLabel.text = "Your age is \((profile?.age)!)"
			ageSpiner.value = Double((profile?.age)!)
		} else {
			ageLabel.text = "Your age is 0"
			ageSpiner.value = 0
		}
		if profile?.status != nil {
			for i in 0...statusSelecter.numberOfSegments - 1 {
				if statusSelecter.titleForSegmentAtIndex(i) == profile?.status {
					statusSelecter.selectedSegmentIndex = i
				}
			}
		} else {
			statusSelecter.selectedSegmentIndex = 0
		}
		if profile?.avatar != nil {
			accountImg.image = profile?.avatar
		} else {
			accountImg.image = UIImage(named: "photo-350x350")
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
	}

	func switchOffNameAcess() -> Void {
		nameTextField.enabled = false
		nameAccessSwitch.on = false
	}

	func switchOffEmailAcess() -> Void {
		emailTextField.enabled = false
		emailAccessSwitch.on = false
	}

}
