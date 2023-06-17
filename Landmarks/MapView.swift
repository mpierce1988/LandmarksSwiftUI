//
//  MapView.swift
//  Landmarks
//
//  Created by Michael Pierce on 2023-06-17.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // Source of "truth" that can be accessed and modified from other views
    // SwiftUI manages underlying storage and updating of views that depend on this value
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        // $ passes a binding to the region state variable
        // when the user modifies the position on the map, it updates the region variable
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
