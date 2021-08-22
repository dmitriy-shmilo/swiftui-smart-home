//
//  DeviceCardView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import SwiftUI

struct DeviceCardView: View {
	let title: String
	let location: String
	var body: some View {
		HStack {
			VStack(alignment: .leading){
				Text(title)
					.foregroundColor(.font)
					.font(.system(size:18, weight: .bold, design: .rounded))
				Spacer()
				Text(location)
					.foregroundColor(.secondaryFont)
					.font(.system(size:12, weight: .bold, design: .rounded))
			}
			Spacer()
			VStack(alignment: .trailing) {
				Toggle("", isOn: .constant(true))
					.toggleStyle(SwitchToggleStyle(tint: .accentColor))
				Spacer()
				Text("connected")
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
        DeviceCardView(title: "Smart Lamp 1", location: "Living Room")
    }
}
