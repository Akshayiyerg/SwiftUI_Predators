//
//  PredatorDetail.swift
//  Predators_SwiftUI
//
//  Created by Akshay  on 2025-02-05.
//

import SwiftUI

struct PredatorDetail: View {
    let predators: PredatorsModel
    
    var body: some View {
        ScrollView {
            ZStack {
                // Background Image
                Image(predators.type.rawValue)
                    .resizable()
                    .scaledToFit()
                
                // Dino Image
                Image(predators.image)
                    .resizable()
                    .scaledToFit()
            }
            
            // Dino Name
            
            // Current location
            
            // Appears in
            
            // Movie moments
            
            // Link webpage
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predators: PredatorsViewModal().apexPredators[2])
        //.preferredColorScheme(.dark)
}
