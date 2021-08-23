//
//  SensorDataCardView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import SwiftUI

struct SensorDataCardView: View {
	let data: String
	let subtitle: String
	let background: Color
	
	var body: some View {
		VStack(alignment: .center) {
			Spacer()
			Text(data)
				.font(.system(size:18, weight: .bold))
				.padding(.bottom)
			Text(subtitle)
				.font(.system(size:10, weight: .bold))
			Spacer()
		}
		.padding()
		.frame(width: 180, height: 130)
		.foregroundColor(.dataCaption)
		.background(Image("BackgroundOverlay")
						.resizable()
						.background(background)
						.scaledToFill())
		.clipShape(RoundedRectangle(cornerRadius: 10))
	}
}

struct SensorDataCardView_Previews: PreviewProvider {
    static var previews: some View {
        SensorDataCardView(data: "24° C", subtitle: "Temperature", background: .dataOrange)
    }
}
