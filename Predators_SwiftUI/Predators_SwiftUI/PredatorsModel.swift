//
//  PredatorsModel.swift
//  Predators_SwiftUI
//
//  Created by Akshay  on 2025-02-03.
//


struct PredatorsModel: Decodable {
    let id: Int
    let name: String
    let type: String
    let latitude, longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    struct MovieScene: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }

}
