//
//  PredatorsViewModal.swift
//  Predators_SwiftUI
//
//  Created by Akshay  on 2025-02-03.
//

import Foundation

class PredatorsViewModal {
    var apexPredators: [PredatorsModel] = []
    
    init() {
        decodeApexPredators()
    }
    
    func decodeApexPredators() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([PredatorsModel].self, from: data)
                
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
        
    }
}
