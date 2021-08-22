//
//  DataCard.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import SwiftUI

struct DataCardView: View {
	let title: String
	let data: String
	let subtitle: String
	let background: Color
	
	var body: some View {
		VStack(alignment: .leading) {
			Text(title)
				.font(.system(size:12, weight: .bold))
				.frame(maxWidth:.infinity, alignment: .leading)
			Spacer()
			Text(data)
				.font(.system(size:18, weight: .bold))
			Text(subtitle)
				.font(.system(size:10, weight: .bold))
		}
		.padding()
		.frame(width: 180, height: 210)
		.foregroundColor(.dataCaption)
		.background(Image("BackgroundOverlay")
						.resizable()
						.background(background)
						.scaledToFill())
		.clipShape(RoundedRectangle(cornerRadius: 10))
	}
}

struct DataCard_Previews: PreviewProvider {
    static var previews: some View {
        DataCardView(title: "This Month", data: "478.5 KWh", subtitle: "Aug 2021", background: .dataOrange)
    }
}
