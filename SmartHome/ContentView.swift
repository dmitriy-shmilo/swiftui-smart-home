//
//  ContentView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 22.08.2021.
//

import SwiftUI

enum RootPage {
	case home
	case rooms
	case devices
	case settings
}

struct ContentView: View {
	
	@State private var currentTab: RootPage = .home
	
    var body: some View {
    	NavigationView {
    		TabView(selection: $currentTab) {
				HomeView(currentTab: $currentTab)
    				.tag(RootPage.home)
    				.tabItem {
    					VStack {
    						Image(systemName: "house.fill")
    							.font(.system(size: 25))
    						Text("Home")
    							.font(.system(size:12, weight: .bold))
						}
					}
				
				RoomListView(rooms: ModelData.rooms)
    				.tag(RootPage.rooms)
    				.tabItem {
    					Image(systemName: "square.grid.2x2.fill")
    							.font(.system(size: 25))
						Text("Rooms")
							.font(.system(size:12, weight: .bold))
					}
					
				DeviceListView(devices: ModelData.allDevices)
    				.tag(RootPage.devices)
    				.tabItem {
    					Image(systemName: "hifispeaker.fill")
    							.font(.system(size: 25))
						Text("Devices")
							.font(.system(size:12, weight: .bold))
					}
				
				Text("Settings Under Construction")
    				.tag(RootPage.settings)
    				.tabItem {
    					Image(systemName: "gearshape.fill")
    							.font(.system(size: 25))
						Text("Settings")
							.font(.system(size:12, weight: .bold))
					}
				
    		}
    	}
    	.navigationViewStyle(StackNavigationViewStyle())
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
