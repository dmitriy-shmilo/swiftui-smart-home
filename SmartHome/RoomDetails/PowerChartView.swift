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
			ZStack {
				Group {
					LineGraphShape(
						points: makePoints(proxy: proxy, points: lastWeekState), closePath: true)
						.fill(Color.dataOrange.opacity(0.5))

					LineGraphShape(
						points:makePoints(proxy: proxy, points: currentWeekState), closePath: true)
						.fill(Color.dataBlue.opacity(0.5))
				}
				.drawingGroup()
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
		points: [CGFloat]) -> [CGPoint] {
		points.enumerated().map { (i, v) in
			CGPoint(
				x: CGFloat(i) * proxy.size.width / CGFloat(points.count - 1),
				y: proxy.size.height - v * 2 // TODO: use min and max data point to figure out chart scale
			)
		}
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
