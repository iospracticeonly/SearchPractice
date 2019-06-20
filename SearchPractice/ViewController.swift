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
	
	let searchController = UISearchController(searchResultsController: nil)
	
	// MARK: - View Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Setup Search Controller
		searchController.searchResultsUpdater = self
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.placeholder = "Search location"
		navigationItem.searchController = searchController
		definesPresentationContext = true
		
		
		
		
		// Setup tableView
		self.view.addSubview(tableview)
		tableview.delegate = self
		tableview.dataSource = self
		
		setTableViewLayout()
		
		addresses = [
			AddressExample(name: "서울", location: "something0"),
			AddressExample(name: "부산", location: "something1"),
			AddressExample(name: "광주", location: "something2"),
			AddressExample(name: "서울", location: "something3"),
			AddressExample(name: "서울", location: "something4")
		]
		
		tableview.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
		
	}
	
	func setTableViewLayout() {
		tableview.translatesAutoresizingMaskIntoConstraints = false
		tableview.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
		tableview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
		tableview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
		tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
	}
	
	// MARK: - Private instance methods for searching
	
	func searchBarIsEmpty() -> Bool {
		//returns true if the text is empty or nil
		return searchController.searchBar.text?.isEmpty ?? true
	}
	
	func isFiltering() -> Bool {
		return searchController.isActive && !searchBarIsEmpty()
	}
	
	func filterContentForSearchText(_ searchText: String, scope: String = "All") {
		filteredAddresses = addresses.filter({ (addressExample: AddressExample) -> Bool in
			return addressExample.name.lowercased().contains(searchText.lowercased())
		})
		
		tableview.reloadData()
	}


}

extension ViewController: UITableViewDataSource {
	// MARK: - TableViewDataSource
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		return addresses.count
		if isFiltering() {
			return filteredAddresses.count
		}
		
		return addresses.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		
//		let address = addresses[indexPath.row]
		let address: AddressExample
		if isFiltering() {
			address = filteredAddresses[indexPath.row]
		} else {
			address = addresses[indexPath.row]
		}
		
		cell.textLabel!.text = address.name
		cell.detailTextLabel?.text = address.location
		
		return cell
	}
	
	
	
}

extension ViewController: UITableViewDelegate {
	
}

extension ViewController: UISearchResultsUpdating {
	// MARK: - UISearchResultsUpdating Delegate
	
	func updateSearchResults(for searchController: UISearchController) {
//		let searchBar = searchController.searchBar
		
		filterContentForSearchText(searchController.searchBar.text!)
		
		
	}
	
	
}
