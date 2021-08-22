//
//  HomeView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import SwiftUI

struct HomeView: View {
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
								DataCardView(title: "Today", data: "24.55 KWh", subtitle: "Aug 23, 2021", background: .dataBlue)
								
								DataCardView(title: "This Month", data: "478.5 KWh", subtitle: "Aug 2021", background: .dataOrange)
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
							Button(action: {}) {
								Text("See all")
									.foregroundColor(.secondaryFont)
									.font(.system(size:12, weight: .bold))
							}
						}
						.padding(.horizontal, 32)
						
						ScrollView(.horizontal, showsIndicators: false) {
							
							HStack(spacing: 24) {
								
								RoomCardView(title: "Living Room", subtitle: "8 devices connected")
								RoomCardView(title: "Bedroom", subtitle: "2 devices connected")
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
							Button(action: {}) {
								Text("See all")
									.foregroundColor(.secondaryFont)
									.font(.system(size:12, weight: .bold))
							}
						}
						.padding(.horizontal, 32)
						
						ScrollView(.horizontal, showsIndicators: false) {
							
							HStack(spacing: 24) {
								DeviceCardView(title: "Smart Lamp 1", location: "Living Room")
								DeviceCardView(title: "Smart Lamp 2", location: "Living Room")
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
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
