//
//  RoomDetailsView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import SwiftUI

struct RoomDetailsView: View {
	
	@Environment(\.presentationMode) var presentation
	
    var body: some View {
        ScrollView {
        	VStack {
        		HStack {
        			Button(action: {
        				presentation.wrappedValue.dismiss()
					}) {
        				Image(systemName: "chevron.left")
        					.foregroundColor(.font)
        					.font(.system(size: 16))
					}
					
					Spacer()
					Text("Living Room")
						.foregroundColor(.font)
						.font(.system(size: 18, weight: .semibold))
					Spacer()
				}
				
				ScrollView(.horizontal, showsIndicators: false) {
					HStack {
						SensorDataCardView(data: "24° C", subtitle: "Temperature", background: .dataBlue)
						SensorDataCardView(data: "70%", subtitle: "Humidity", background: .dataOrange)
					}
				}
				
				Text("Power consumption")
					.foregroundColor(.font)
					.font(.system(size:18, weight: .bold))
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.top)
				
				PowerChartView()
					
				Text("Devices")
					.foregroundColor(.font)
					.font(.system(size:18, weight: .bold))
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.top)
					
				DeviceCardView(title: "Smart lamp 1", location: "Living room")
				DeviceCardView(title: "Smart lamp 2", location: "Living room")
			}
			.padding()
		}
		.background(Color.background.ignoresSafeArea())
		.navigationBarHidden(true)
    }
}

struct RoomDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RoomDetailsView()
    }
}
