//
//  ModelData.swift
//  Landmarks
//
//  Created by Michael Pierce on 2023-06-17.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    
    // Computed array of landmarks that are featured
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    // Computed value that maps string keys to arrays of landmark objects
    // computes the value based on the current landmarks array value
    var categories: [String: [Landmark]] {
        // Group all landmarks that have the same category into the same array
        // and use the category as the key in this dictionary
        Dictionary(grouping: landmarks, by: {$0.category.rawValue })
    }
}



func load<T: Decodable>(_ filename: String) -> T {
    // variable to hold data from file
    let data: Data
    
    // validate file exists by attempting to retrieve it and save to variable "file"
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    // try to load data from file
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from the main bundle:\n\(error)")
    }
    
    // try to decode data as json
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
