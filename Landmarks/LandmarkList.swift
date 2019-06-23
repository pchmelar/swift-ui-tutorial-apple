//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Petr Chmelar on 23/06/2019.
//  Copyright © 2019 Qest. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
	@EnvironmentObject var userData: UserData
	
    var body: some View {
		NavigationView {
			List {
				Toggle(isOn: $userData.showFavoritesOnly) {
					Text("Favorites only")
				}
				
				ForEach(userData.landmarks) { landmark in
					if !self.userData.showFavoritesOnly || landmark.isFavorite {
						NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
							LandmarkRow(landmark: landmark)
						}
					}
				}
			}
			.navigationBarTitle(Text("Landmarks"))
		}
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
//		ForEach(["iPhone 8", "iPhone XS", "iPhone XS Max"].identified(by: \.self)) { deviceName in
//			LandmarkList()
//				.previewDevice(PreviewDevice(rawValue: deviceName))
//		}
		LandmarkList()
			.environmentObject(UserData())
    }
}
#endif
