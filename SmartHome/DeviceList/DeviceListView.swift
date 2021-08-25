//
//  DeviceListView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 25.08.2021.
//

import SwiftUI

struct DeviceListView: View {
	let devices: [Device]
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				HStack {
					Text("Devices")
						.foregroundColor(.font)
						.font(.system(size:16, weight: .bold))
					Spacer()
				}
				.padding(.vertical)
				
				ForEach(devices) { device in
					if let room = ModelData.room(withId: device.roomId) {
						NavigationLink(destination:RoomDetailsView(room: room)) {
							DeviceListItemView(device: device, room: room)
						}
					} else {
						DeviceListItemView(device: device, room:nil)
					}
				}
			}
			.padding(.horizontal)
		}
		.background(Color.background.ignoresSafeArea())
		.navigationBarHidden(true)
	}
}

struct DeviceListView_Previews: PreviewProvider {
	static var previews: some View {
		DeviceListView(devices: ModelData.allDevices)
	}
}
