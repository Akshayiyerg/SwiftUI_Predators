//
//  ContentView.swift
//  Predators_SwiftUI
//
//  Created by Akshay  on 2025-02-02.
//

import SwiftUI

struct ContentView: View {
    let predators = PredatorsViewModal()
    
    @State var searchText = ""
    
    var filteredDinos: [PredatorsModel] {
        if searchText.isEmpty {
            return predators.apexPredators
        } else {
            return predators.apexPredators.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredDinos) { predators in
                NavigationLink {
                    Image(predators.image)
                        .resizable()
                        .scaledToFit()
                } label: {
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
            }
            .navigationTitle(Text("Apex Predators"))
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
