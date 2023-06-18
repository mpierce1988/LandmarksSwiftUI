//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Michael Pierce on 2023-06-17.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
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

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {

        ForEach(["iPhone 14 Pro Max", "iPhone SE (3rd generation)", "iPad Pro (12.9-inch) (6th generation)"], id: \.self) { deviceName in

            LandmarkList()
                

                .previewDevice(PreviewDevice(rawValue: deviceName))

                .previewDisplayName(deviceName)

        }

    }
}
