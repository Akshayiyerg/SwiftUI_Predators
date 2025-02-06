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
    @State var alphabetical = false
    @State var currentSelection = APType.all
    
    var filteredDinos: [PredatorsModel] {
        predators.filter(by: currentSelection)
        
        predators.sort(by: alphabetical)
        
        return predators.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack {
            List(filteredDinos) { predators in
                NavigationLink {
                    PredatorDetail()
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            alphabetical.toggle()
                        }
                    } label: {
                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentSelection.animation()) {
                            ForEach(APType.allCases) { type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
