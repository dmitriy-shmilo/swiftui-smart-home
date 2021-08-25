//
//  RoomCard.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import SwiftUI

struct RoomCardView: View {
	let room: Room
	let devices: [Device]
	
	var body: some View {
		VStack(alignment: .leading) {
			HStack {
				Image(systemName: "square.grid.2x2.fill")
					.foregroundColor(.font)
					.font(.system(size:24))
				Text(room.name)
					.foregroundColor(.font)
					.font(.system(size:18, weight: .bold, design: .rounded))
					.padding(.horizontal)
				Spacer()
			}
			Spacer()
			Text("\(room.devices.filter { $0.isConnected }.count) device(s) connected")
				.foregroundColor(.secondaryFont)
				.font(.system(size:12, weight: .semibold))
		}
		.padding()
		.frame(height: 140)
		.background(RoundedRectangle(cornerRadius: 10).foregroundColor(.panel))
	}
}

struct RoomCard_Previews: PreviewProvider {
    static var previews: some View {
        RoomCardView(room: ModelData.rooms[0], devices: ModelData.rooms[0].devices)
    }
}
