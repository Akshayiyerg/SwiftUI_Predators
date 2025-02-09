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
                        .overlay {
                            LinearGradient(stops: [Gradient.Stop(color: .clear, location: 0.8), Gradient.Stop(color: .black, location: 1)], startPoint: .top, endPoint: .bottom)
                        }
                    
                    // Dino Image
                    Image(predators.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20) // this creates the 3d effect. Due to this dino legs is out of image
                }
                
                VStack(alignment: .leading) {
                    // Dino Name
                    Text(predators.name)
                        .font(.largeTitle)
                    // Current location
                    
                    // Appears in
                    Text("Appears In:")
                        .font(.title3)
                    
                    ForEach(predators.movies, id: \.self) { movie in
                        Text("•" + movie)
                    }
                    
                    // Movie moments
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    
                    ForEach(predators.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)
                        
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    
                    // Link webpage
                    Text("Read More:")
                        .font(.caption)
                    
                    Link(predators.link, destination: URL(string: predators.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                }
                .padding()
                .padding(.bottom)
                .frame(width: geo.size.width, alignment: .leading)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predators: PredatorsViewModal().apexPredators[10])
        .preferredColorScheme(.dark)
}
