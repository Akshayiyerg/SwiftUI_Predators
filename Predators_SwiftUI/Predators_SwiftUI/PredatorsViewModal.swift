//
//  PredatorsViewModal.swift
//  Predators_SwiftUI
//
//  Created by Akshay  on 2025-02-03.
//

import Foundation

class PredatorsViewModal {
    var allApexPredators: [PredatorsModel] = []
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
                allApexPredators = apexPredators
                
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
        
    }
    
    func search(for searchTerm: String) -> [PredatorsModel] {
        if searchTerm.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter {
                $0.name.lowercased().contains(searchTerm.lowercased())
            }
        }
    }
    
    func sort(by alphabetical: Bool) {
        apexPredators.sort { predators1, predators2 in
            if alphabetical {
                predators1.name < predators2.name
            } else {
                predators1.id < predators2.id
            }
        }
    }
    
    func filter(by type: APType) {
        if type == .all {
            apexPredators = allApexPredators
        } else {
            apexPredators = allApexPredators.filter { predators in
                predators.type == type
            }
        }
    }
}
