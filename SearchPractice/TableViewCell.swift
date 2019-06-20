//
//  TableViewCell.swift
//  SearchPractice
//
//  Created by 변재우 on 20190620//.
//  Copyright © 2019 변재우. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .subtitle, reuseIdentifier: "Cell")
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
