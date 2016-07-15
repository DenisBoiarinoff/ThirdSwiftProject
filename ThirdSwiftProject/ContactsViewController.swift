//
//  ContactsViewController.swift
//  ThirdSwiftProject
//
//  Created by Rhinoda3 on 14.07.16.
//  Copyright © 2016 Rhinoda. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	let studentsGroup: NSDictionary? = [
		0 : ["name": "Tom", "phone": "12345", "email": "Tom@mail.com"],
		1 : ["name": "Bill", "phone": "23456", "email": "Bill@mail.com"],
		2 : ["name": "Tom", "phone": "34567", "email": "Tom1@mail.com"],
		3 : ["name": "Joe", "phone": "45678", "email": "Joe@mail.com"],
		4 : ["name": "Tom", "phone": "56789", "email": "Tom2@mail.com"],
		]

	// cell reuse id (cells that scroll out of view can be reused)
	let contactTableViewCell = "ContactTableViewCell"

	@IBOutlet weak var contactsTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

		contactsTable.dataSource = self
		contactsTable.delegate = self

		contactsTable.registerNib(UINib(nibName: contactTableViewCell, bundle: nil), forCellReuseIdentifier: contactTableViewCell)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	// MARK: - Table view data source

	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return studentsGroup!.count
	}


	//	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
	//		let parentBounsd = UIScreen.mainScreen().bounds
	//		let parentHeight = parentBounsd.size.height;
	//
	//		let view: UIView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, parentHeight * 0.15))
	//		/* Create custom view to display section header... */
	//		let label: UILabel = UILabel(frame: CGRectMake(0, 0, tableView.frame.size.width, parentHeight * 0.1))
	//		label.font = UIFont(name: "Arial", size: parentHeight * 0.03)
	//		let header = "Contacts"
	//		/* Section header is in 0th index... */
	//		label.text = header
	//		label.textAlignment = NSTextAlignment.Center
	//		view.addSubview(label)
	//		view.backgroundColor = UIColor.grayColor()
	//
	//		return view
	//	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCellWithIdentifier(contactTableViewCell, forIndexPath: indexPath) as! ContactTableViewCell

		let student: NSDictionary = studentsGroup![indexPath.row] as! NSDictionary

		cell.name.text = student["name"] as? String;
		cell.phone.text = student["phone"]as? String;
		cell.email.text = student["email"]as? String;
		
		return cell
	}

}
