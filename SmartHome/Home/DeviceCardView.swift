//
//  DeviceCardView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import SwiftUI

struct DeviceCardView: View {
	let device: Device
	let room: Room?

	var body: some View {
		HStack {
			VStack(alignment: .leading){
				Text(device.name)
					.foregroundColor(.font)
					.font(.system(size:18, weight: .bold, design: .rounded))
					.lineLimit(1)
				Spacer()
				Text(room?.name ?? "")
					.foregroundColor(.secondaryFont)
					.font(.system(size:12, weight: .bold, design: .rounded))
					.lineLimit(1)
			}
			Spacer()
			VStack(alignment: .trailing) {
				Toggle("", isOn: .constant(device.isConnected))
					.toggleStyle(SwitchToggleStyle(tint: .accentColor))
				Spacer()
				Text(device.isConnected ? "connected" : "not connected")
					.foregroundColor(.secondaryFont)
					.font(.system(size:12, weight: .bold, design: .rounded))
			}
		}
		.padding()
		.frame(width: 380, height: 120)
		.background(RoundedRectangle(cornerRadius: 10).foregroundColor(.panel))
	}
}

struct DeviceCardView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceCardView(device: ModelData.allDevices[0], room: ModelData.rooms[0])
    }
}
