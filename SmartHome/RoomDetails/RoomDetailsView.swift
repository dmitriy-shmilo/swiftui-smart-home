//
//  RoomDetailsView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import SwiftUI

struct RoomDetailsView: View {
	
	@Environment(\.presentationMode) var presentation
	@State private var counterProgress: Double = 0.0
	private let counterSteps = 100.0
	
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
						SensorDataCardView(data: "\(floor(24 * counterProgress))° C", subtitle: "Temperature", background: .dataBlue)
						SensorDataCardView(data: "\(floor(70 * counterProgress))%", subtitle: "Humidity", background: .dataOrange)
					}
					.onAppear {
						Timer.scheduledTimer(
							withTimeInterval: 0.75 / counterSteps, repeats: true
						) { timer in
							counterProgress += 1.0 / counterSteps
							if counterProgress >= 1.0 {
								timer.invalidate()
							}
						}
					}
				}
				
				Text("Power consumption")
					.foregroundColor(.font)
					.font(.system(size:18, weight: .bold))
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.top)
				
				PowerChartView(
					lastWeekData: [24.5,0, 30.0, 12.2, 41.3, 18.9, 39.7],
					currentWeekData: [14.5, 25.1, 34.0, 12.5, 37.3, 11.0, 0]
				)
				
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
