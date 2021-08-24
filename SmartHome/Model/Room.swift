//
//  Room.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 24.08.2021.
//

import Foundation

struct Room: Hashable, Identifiable {
	let id: Int
	let name: String
	let devices: [Device]
	let sensors: [Sensor]
	let consumption: [Double]
}
