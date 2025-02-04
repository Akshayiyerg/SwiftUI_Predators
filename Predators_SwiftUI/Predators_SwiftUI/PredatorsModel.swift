//
//  PredatorsModel.swift
//  Predators_SwiftUI
//
//  Created by Akshay  on 2025-02-03.
//

import SwiftUI

struct PredatorsModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: APType
    let latitude, longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    struct MovieScene: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
    enum APType: String, Decodable {
        case land
        case air
        case sea
        
        var background: Color {
            switch self {
            case .land:
                return .brown
            case .air:
                return .teal
            case .sea:
                return .blue
            }
        }
    }

}
