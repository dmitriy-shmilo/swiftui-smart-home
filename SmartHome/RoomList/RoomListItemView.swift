//
//  RoomListItemView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 25.08.2021.
//

import SwiftUI

struct RoomListItemView: View {
	let room: Room
	let devices: [Device]
	
	var body: some View {
		HStack {
			Image(systemName: "square.grid.2x2.fill")
				.foregroundColor(.font)
				.font(.system(size:24))
			VStack(alignment: .leading, spacing: 4) {
				Text(room.name)
					.foregroundColor(.font)
					.font(.system(size:18, weight: .bold, design: .rounded))
				Text("\(room.devices.filter { $0.isConnected }.count)/\(room.devices.count) device(s) connected")
					.foregroundColor(.secondaryFont)
					.font(.system(size:12, weight: .semibold))
			}
			.padding(.horizontal)
			Spacer()
			Image(systemName: "chevron.right")
				.foregroundColor(.font)
		}
		.padding()
		.background(RoundedRectangle(cornerRadius: 10).foregroundColor(.panel))
	}
}

struct RoomListItemView_Previews: PreviewProvider {
	static var previews: some View {
		RoomListItemView(room: ModelData.rooms[0], devices: ModelData.rooms[0].devices)
	}
}
