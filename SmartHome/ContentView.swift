//
//  ContentView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 22.08.2021.
//

import SwiftUI

struct ContentView: View {
	
	enum RootPage {
	case home
	case rooms
	case devices
	case settings
	}
	
	@State private var currentTab: RootPage = .home
	
    var body: some View {
    	NavigationView {
    		TabView(selection: $currentTab) {
    			HomeView()
    				.tag(RootPage.home)
    				.tabItem {
    					VStack {
    						Image(systemName: "house.fill")
    							.font(.system(size: 25))
    						Text("Home")
    							.font(.system(size:12, weight: .bold))
						}
					}
				
				Text("Rooms List Under Construction")
    				.tag(RootPage.rooms)
    				.tabItem {
    					Image(systemName: "square.grid.2x2.fill")
    							.font(.system(size: 25))
						Text("Rooms")
							.font(.system(size:12, weight: .bold))
					}
					
				Text("Device List Under Construction")
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
