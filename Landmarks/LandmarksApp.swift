//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Michael Pierce on 2023-06-17.
//

import SwiftUI

@main
struct LandmarksApp: App {
    // StateObject initializes a model object for a property only once
    // during the life time of the app. This is true in an app instance, like here,
    // and when you use it inside a view
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
