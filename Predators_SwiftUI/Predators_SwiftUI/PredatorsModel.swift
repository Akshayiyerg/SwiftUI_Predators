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
}

enum APType: String, Decodable, CaseIterable, Identifiable {
    case all
    case land
    case air
    case sea
    
    var id: APType {
        self
    }
    
    var background: Color {
        switch self {
        case .land:
                .brown
        case .air:
                .teal
        case .sea:
                .blue
        case .all:
                .black
        }
    }
    
    var icon: String {
        switch self {
        case .land:
            "leaf.fill"
        case .air:
            "wind"
        case .sea:
            "drop.fill"
        case .all:
            "square.stack.3d.up.fill"
        }
    }
}
