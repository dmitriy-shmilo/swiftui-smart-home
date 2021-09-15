//
//  PowerChartView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import SwiftUI

struct PowerChartView: View {
	let lastWeekData: [CGFloat]
	let currentWeekData: [CGFloat]
	
	@State var lastWeekState: [CGFloat] = []
	@State var currentWeekState: [CGFloat] = []
	
	var body: some View {
		
		GeometryReader { proxy in
			ZStack(alignment: .top) {
				Group {
					let lowerBound = min(lastWeekState.min() ?? 0.0,
										 currentWeekState.min() ?? 0.0)
					let upperBound = max(lastWeekState.max() ?? 0.0,
										 currentWeekState.max() ?? 0.0)
					let range = lowerBound...upperBound
					LineGraphShape(
						points: makePoints(proxy: proxy, points: lastWeekState, within: range), closePath: true)
						.fill(Color.dataOrange.opacity(0.5))
					
					LineGraphShape(
						points:makePoints(proxy: proxy, points: currentWeekState, within: range), closePath: true)
						.fill(Color.dataBlue.opacity(0.5))
				}
				.drawingGroup()
				
				HStack {
					Text(Date().formatMonthYear())
						.foregroundColor(.font)
						.font(.system(size:16, weight: .bold))
					Spacer()
					VStack(spacing: 4) {
						Text("• This week")
							.foregroundColor(.dataBlue)
						Text("• Last week")
							.foregroundColor(.dataOrange)
					}
					.font(.system(size: 14, weight: .bold, design: .rounded))
					.frame(width: 130)
				}
				.padding()
			}
		}
		.frame(height: 250)
		.background(Color.panel)
		.clipShape(RoundedRectangle(cornerRadius: 15))
		.onAppear {
			lastWeekState = lastWeekData.map { x in 0 }
			currentWeekState = currentWeekData.map { x in 0 }
			withAnimation(.easeOut(duration: 0.75)) {
				lastWeekState = lastWeekData
				currentWeekState = currentWeekData
			}
		}
	}
	
	func makePoints(
		proxy: GeometryProxy,
		points: [CGFloat],
		within range: ClosedRange<CGFloat>) -> [CGPoint] {
		
		let delta = range.upperBound - range.lowerBound
		let max = delta != 0 ? range.upperBound : 1
		let min:CGFloat = delta != 0 ? range.lowerBound : 0
		let ratio = (proxy.size.height - 0) / (max - min)
		
		let result = points.enumerated().map { (i, v) -> CGPoint in
			print(ratio * (v - min))
			return CGPoint(
				x: CGFloat(i) * proxy.size.width / CGFloat(points.count - 1),
				y: proxy.size.height - ratio * (v - min)
			)
		}
		
		return result
	}
}

struct PowerChartView_Previews: PreviewProvider {
	static var previews: some View {
		PowerChartView(
			lastWeekData: [24.5,0, 30.0, 12.2, 41.3, 18.9, 39.7],
			currentWeekData: [14.5, 25.1, 34.0, 12.5, 37.3, 11.0, 0]
		)
	}
}
