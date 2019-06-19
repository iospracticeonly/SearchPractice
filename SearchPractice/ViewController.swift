//
//  ViewController.swift
//  SearchPractice
//
//  Created by 변재우 on 20190619//.
//  Copyright © 2019 변재우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - Properties
	var tableview: UITableView = UITableView()
//	var jusos = [juso]()
//	var filteredjusos = [juso]()
	var addresses = [AddressExample]()
	var filteredAddresses = [AddressExample]()
	

	var tableviewCell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
	
	// MARK: - View Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.addSubview(tableview)
		tableview.delegate = self
		tableview.dataSource = self
		
		setTableViewLayout()
		
		addresses = [
			AddressExample(name: "서울", location: "something0"),
			AddressExample(name: "서울", location: "something1"),
			AddressExample(name: "서울", location: "something2"),
			AddressExample(name: "서울", location: "something3"),
			AddressExample(name: "서울", location: "something4")
		]
		
		tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
		
	}
	
	func setTableViewLayout() {
		tableview.translatesAutoresizingMaskIntoConstraints = false
		tableview.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
		tableview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
		tableview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
		tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
	}


}

extension ViewController: UITableViewDataSource {
	// MARK: - TableViewDataSource
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		//
		return addresses.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		
		
		let address = addresses[indexPath.row]
		
		cell.textLabel!.text = address.name
		cell.detailTextLabel?.text = address.location
		
		return cell
	}
	
	
	
}

extension ViewController: UITableViewDelegate {
	
}

