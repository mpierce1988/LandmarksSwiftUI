//
//  Landmark.swift
//  Landmarks
//
//  Created by Michael Pierce on 2023-06-17.
//

import Foundation

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
}
