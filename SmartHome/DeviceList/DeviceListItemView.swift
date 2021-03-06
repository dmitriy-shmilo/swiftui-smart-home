//
//  DeviceListItemView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 25.08.2021.
//

import SwiftUI

struct DeviceListItemView: View {
    let device: Device
	let room: Room?
	
	var body: some View {
		HStack {
			Image(systemName: device.type.iconName)
				.font(.system(size:24))
			VStack(alignment: .leading, spacing: 4) {
				Text(device.name)
					.font(.system(size:18, weight: .bold, design: .rounded))
				Text("\(room?.name ?? "Unknown Location") (\(device.isConnected ? "connected" : "disconnected"))")
					.font(.system(size:12, weight: .semibold))
					.foregroundColor(.secondaryFont)
			}
			.padding(.horizontal)
			Spacer()
			if room != nil {
				Image(systemName: "chevron.right")
			}
		}
		.foregroundColor(device.isConnected ? .font : .secondaryFont)
		.padding()
		.background(RoundedRectangle(cornerRadius: 10).foregroundColor(.panel))
	}
}

struct DeviceListItemView_Previews: PreviewProvider {
    static var previews: some View {
		DeviceListItemView(device: ModelData.allDevices[0], room: ModelData.room(withId: ModelData.allDevices[0].roomId))
    }
}
