//
//  ToolbarView.swift
//  SmartHome
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import SwiftUI

struct ToolbarView: View {
    var body: some View {
        HStack {
        	VStack(alignment: .leading) {
        		Text("Welcome, Dmitriy")
        			.foregroundColor(.font)
        			.font(.system(size:16, weight: .bold))
        		Text("Aug 23, 2021")
        			.foregroundColor(.secondaryFont)
        			.font(.system(size:12, weight: .semibold))
			}
			
			Spacer()
			
			Button(action: {}) {
				Image(systemName: "bell.fill")
					.foregroundColor(.font)
					.font(.system(size: 30))
			}
		}
		.padding()
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}
