//
//  HomeView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import SwiftUI

struct HomeView: View {
	let featuredRooms = ModelData.rooms[0..<2]
	let featuredDevices = ModelData.allDevices[0..<4]
	@Binding var currentTab: RootPage
	
	var body: some View {
		GeometryReader { proxy in
			
			ScrollView {
				VStack {
					ToolbarView()
						.padding(.top, proxy.safeAreaInsets.top)
					
					VStack(alignment: .leading) {
						Text("Energy Usage")
							.foregroundColor(.font)
							.font(.system(size:16, weight: .bold))
						ScrollView(.horizontal, showsIndicators: false) {
							
							HStack(spacing: 24) {
								DataCardView(
									title: "Today",
									data: String(format: "%.2f KWh", ModelData.energyConsumption(dayRange: 0..<1)),
									subtitle: Date().formatShortDate(),
									background: .dataBlue
								)
								
								DataCardView(
									title: "This Month",
									data: String(format: "%.2f KWh", ModelData.energyConsumption(dayRange: 0..<30)),
									subtitle: Date().formatMonthYear(),
									background: .dataOrange)
							}
							
						}
					}
					.padding()
					
					VStack(alignment: .leading) {
						HStack {
							Text("Rooms")
								.foregroundColor(.font)
								.font(.system(size:16, weight: .bold))
							Spacer()
							Button(action: {
								currentTab = .rooms
							}) {
								Text("See all")
									.foregroundColor(.secondaryFont)
									.font(.system(size:12, weight: .bold))
							}
						}
						.padding(.horizontal, 32)
						
						ScrollView(.horizontal, showsIndicators: false) {
							HStack(spacing: 24) {
								ForEach(featuredRooms) { room in
									NavigationLink(destination: RoomDetailsView(room: room)) {
										RoomCardView(
											room: room,
											devices: room.devices
										)
									}
								}
							}
							.padding(.leading, 32)
						}
					}
					.padding(.vertical)
					
					VStack(alignment: .leading) {
						HStack {
							Text("Devices")
								.foregroundColor(.font)
								.font(.system(size:16, weight: .bold))
							Spacer()
							Button(action: {
								currentTab = .devices
							}) {
								Text("See all")
									.foregroundColor(.secondaryFont)
									.font(.system(size:12, weight: .bold))
							}
						}
						.padding(.horizontal, 32)
						
						ScrollView(.horizontal, showsIndicators: false) {
							
							HStack(spacing: 24) {
								ForEach(featuredDevices) { device in
									DeviceCardView(
										device: device,
										room: ModelData.room(withId: device.roomId)
									)
								}
							}
							.padding(.leading, 32)
						}
					}
					.padding(.vertical)
				}
				.padding(.leading, proxy.safeAreaInsets.leading)
				.padding(.trailing, proxy.safeAreaInsets.trailing)
			}
			.ignoresSafeArea()
			.background(Color.background.ignoresSafeArea())
			.navigationBarHidden(true)
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView(currentTab: .constant(.home))
	}
}
