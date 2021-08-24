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

extension SensorType {
	var unitLabel: String {
		switch self {
		case .unknown:
			return ""
		case .temperature:
			return "°C"
		case .humidity:
			return "%"
		case .light:
			return "lx"
		}
	}
	
	var name: String {
		switch self {
		case .unknown:
			return ""
		case .temperature:
			return "Temperature"
		case .humidity:
			return "Humidity"
		case .light:
			return "Light Level"
		}
	}
}

struct Sensor: Hashable, Identifiable {
	let id: Int
	let roomId: Int
	let data: Double
	let type: SensorType
}

extension Sensor {
	var dataLabel: String {
		String(format: "%.2f %@", data, type.unitLabel)
	}
}
