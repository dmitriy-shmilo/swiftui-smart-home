//
//  RoomDetailsView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import SwiftUI

struct RoomDetailsView: View {
	let room: Room

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
					Text(room.name)
						.foregroundColor(.font)
						.font(.system(size: 18, weight: .semibold))
					Spacer()
				}
				
				ScrollView(.horizontal, showsIndicators: false) {
					HStack {
						ForEach(room.sensors.indices) { index in
							let sensor = room.sensors[index]
							SensorDataCardView(
								data: "\(floor(sensor.data * counterProgress)) \(sensor.type.unitLabel)",
								subtitle: sensor.type.name,
								background: index.isMultiple(of: 2)
									? Color.dataBlue
									: Color.dataOrange
							)
						}
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
					lastWeekData: room.consumption[7..<14].map { CGFloat($0) },
					currentWeekData: room.consumption[0..<7].map { CGFloat($0) }
				)
				
				Text("Devices")
					.foregroundColor(.font)
					.font(.system(size:18, weight: .bold))
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.top)
				
				ForEach(room.devices) { device in
					DeviceCardView(device: device, room: room)
				}
			}
			.padding()
		}
		.background(Color.background.ignoresSafeArea())
		.navigationBarHidden(true)
	}
}

struct RoomDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		RoomDetailsView(room: ModelData.rooms[0])
	}
}
