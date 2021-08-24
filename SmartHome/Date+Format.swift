//
//  Date+Format.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 24.08.2021.
//

import Foundation

extension Date {

	func formatShortDate() -> String {
		let formatter = DateFormatter();
		formatter.dateFormat = "MMM dd, yyyy"
		return formatter.string(from: self)
	}
	
	func formatMonthYear() -> String {
		let formatter = DateFormatter();
		formatter.dateFormat = "MMM yyyy"
		return formatter.string(from: self)
	}
}
