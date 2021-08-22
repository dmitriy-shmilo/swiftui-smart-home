//
//  RoomCard.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import SwiftUI

struct RoomCardView: View {
	let title: String
	let subtitle: String
	
	var body: some View {
		VStack(alignment: .leading) {
			HStack {
				Image(systemName: "square.grid.2x2.fill")
					.foregroundColor(.font)
					.font(.system(size:24))
				Text(title)
					.foregroundColor(.font)
					.font(.system(size:18, weight: .bold, design: .rounded))
					.padding(.horizontal)
				Spacer()
			}
			Spacer()
			Text(subtitle)
				.foregroundColor(.secondaryFont)
				.font(.system(size:12, weight: .semibold))
		}
		.padding()
		.frame(width: 240, height: 140)
		.background(RoundedRectangle(cornerRadius: 10).foregroundColor(.panel))
	}
}

struct RoomCard_Previews: PreviewProvider {
    static var previews: some View {
        RoomCardView(title: "Bedroom", subtitle: "2 devices connected")
    }
}
