//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Michael Pierce on 2023-06-17.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    
    // filter landmarks based on showFavoritesOnly
    // if showFavoritesOnly, only return landmarks that are favourited
    var filteredLandmarks: [Landmark] {
        landmarks.filter {landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {

        ForEach(["iPhone 14 Pro Max", "iPhone SE (3rd generation)", "iPad Pro (12.9-inch) (6th generation)"], id: \.self) { deviceName in

            LandmarkList()
                

                .previewDevice(PreviewDevice(rawValue: deviceName))

                .previewDisplayName(deviceName)

        }

    }
}
