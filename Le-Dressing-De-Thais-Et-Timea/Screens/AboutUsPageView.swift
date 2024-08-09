//
//  AboutUsPageView.swift
//  Furniture_app
//
//  Created by William on 09/08/2024.
//

import SwiftUI
// Renommez cette structure pour éviter la duplication
struct AboutUsPageViewTest: View {
    var body: some View {
        VStack {
            Text("À propos de nous")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Voici la page À propos de nous. Vous pouvez ajouter ici des informations sur votre entreprise, votre mission, votre équipe, etc.")
                .padding()
            
            Spacer()
        }
        .navigationBarTitle("À propos de nous", displayMode: .inline)
    }
}
