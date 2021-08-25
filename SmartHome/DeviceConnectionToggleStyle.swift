//
//  DeviceConnectionToggleStyle.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 26.08.2021.
//

import SwiftUI

struct DeviceConnectionToggleStyle: ToggleStyle {
	func makeBody(configuration: Configuration) -> some View {
		ZStack {
			Capsule(style: .circular)
				.fill(Color.toggleBackground)
			Circle()
				.fill(configuration.isOn ? Color.accentColor : Color.font)
				.frame(width: 20, height: 20)
				.offset(x: configuration.isOn ? 15 : -15, y: 0.0)
				.animation(.easeInOut)
		}
		.frame(width: 60, height: 30)
		.onTapGesture {
			configuration.isOn.toggle()
		}
	}
}

struct DeviceConnectionToggleStyle_Previews: PreviewProvider {
	static var previews: some View {
		Toggle("Test", isOn: .constant(true))
			.toggleStyle(DeviceConnectionToggleStyle())
	}
}
