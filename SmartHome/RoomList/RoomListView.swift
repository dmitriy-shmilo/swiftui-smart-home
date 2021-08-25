//
//  RoomListView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 24.08.2021.
//

import SwiftUI

struct RoomListView: View {
	let rooms: [Room]

    var body: some View {
        ScrollView {
        	VStack(alignment: .leading) {
        		HStack {
        			Text("Rooms")
						.foregroundColor(.font)
						.font(.system(size:16, weight: .bold))
        			Spacer()
				}
				.padding(.vertical)
				
        		ForEach(rooms) { room in
        			NavigationLink(destination: RoomDetailsView(room: room)) {
        				RoomListItemView(room: room, devices: room.devices)
        			}
				}
			}
			.padding(.horizontal)
		}
		.background(Color.background.ignoresSafeArea())
		.navigationBarHidden(true)
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView(rooms: ModelData.rooms)
    }
}
