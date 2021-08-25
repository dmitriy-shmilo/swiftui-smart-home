//
//  DeviceType.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 25.08.2021.
//

import Foundation

enum DeviceType {
	case ligthing
	case temperature
	case media
	case other
}

extension DeviceType {
	var iconName: String {
		switch self {
		case .ligthing:
			return "lightbulb.fill"
		case .temperature:
			return "thermometer"
		case .media:
			return "hifispeaker.fill"
		default:
			return "gearshape2.fill"
		}
	}
}
