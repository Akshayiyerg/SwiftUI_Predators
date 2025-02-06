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
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    // Background Image
                    Image(predators.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    // Dino Image
                    Image(predators.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20) // this creates the 3d effect. Due to this dino legs is out of image
                }
                
                // Dino Name
                
                // Current location
                
                // Appears in
                
                // Movie moments
                
                // Link webpage
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predators: PredatorsViewModal().apexPredators[2])
        //.preferredColorScheme(.dark)
}
