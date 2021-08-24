//
//  Device.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 24.08.2021.
//

import Foundation

struct Device: Hashable, Identifiable {
	let id: Int
	let roomId: Int
	let name: String
	let isConnected: Bool
}
