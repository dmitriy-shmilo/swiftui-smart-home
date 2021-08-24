//
//  Sensor.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 24.08.2021.
//

import Foundation

enum SensorType {
	case unknown
	case temperature
	case humidity
	case light
}

struct Sensor: Hashable, Identifiable {
	let id: Int
	let roomId: Int
	let data: Double
	let type: SensorType
}

extension Sensor {
	var dataLabel: String {
		let number = String(format: "%.2f", data)
		switch type {
		case .unknown:
			return "\(number)"
		case .temperature:
			return "\(number) °C"
		case .humidity:
			return "\(number) %"
		case .light:
			return "\(number) lx"
		}
	}
}
