//
//  ContentView.swift
//  Predators_SwiftUI
//
//  Created by Akshay  on 2025-02-02.
//

import SwiftUI

struct ContentView: View {
    let predators = PredatorsViewModal()
    
    var body: some View {
        List(predators.apexPredators) { predators in
            HStack {
                // Dinosaur image
                Image(predators.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .shadow(color: .white, radius: 1)
                
                VStack(alignment: .leading) {
                    // Dinosaur name
                    Text(predators.name)
                        .fontWeight(.bold)
                    
                    // Type
                    Text(predators.type.rawValue.capitalized)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 13)
                        .padding(.vertical, 5)
                        .background(predators.type.background)
                        .clipShape(.capsule)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
