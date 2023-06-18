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
