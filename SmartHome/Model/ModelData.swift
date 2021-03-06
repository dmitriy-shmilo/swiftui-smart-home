//
//  ModelData.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 24.08.2021.
//

import Foundation


struct ModelData {
	
	static let rooms: [Room] = Self.generateRooms()
	
	static var allDevices: [Device] {
		Self.rooms.map{ $0.devices }.reduce([], +)
	}
	
	static var allSensors: [Sensor] {
		Self.rooms.map{ $0.sensors }.reduce([], +)
	}
	
	static func energyConsumption(dayRange: Range<Int>) -> Double {
		return Self.rooms
			.map { $0.consumption[dayRange].reduce(0, +) }
			.reduce(0, +)
	}
	
	static func room(withId: Int) -> Room? {
		Self.rooms.first { room in room.id == withId}
	}
	
	private static var lastId = 0
	private static func generateRooms() -> [Room] {
		["Living Room", "Dining Room", "Bedroom"].enumerated().map { (i, name) in
			let roomId = nextId()
			return Room(
				id: roomId,
				name: name,
				devices: Self.generateDevices(roomId: roomId),
				sensors: Self.generateSensors(roomId: roomId),
				consumption: (0...30).map { _ in Double.random(in: 5.0...10.0)}
			)
		}
	}
	
	private static func generateDevices(roomId: Int) -> [Device] {
		[
			("Smart Lamp 1", DeviceType.ligthing),
			("Smart Lamp 2", DeviceType.ligthing),
			("Thermostat", DeviceType.temperature)
		].map { device in
			Device(id: nextId(), roomId: roomId, name: device.0, type: device.1, isConnected: Bool.random())
		}
	}
	
	private static func generateSensors(roomId: Int) -> [Sensor] {
		[SensorType.temperature, SensorType.humidity].map { type in
			Sensor(id: nextId(), roomId: roomId, data: Double.random(in: 15.0...40.0), type: type)
		}
	}
	
	private static func nextId() -> Int {
		lastId += 1
		return lastId
	}
}
