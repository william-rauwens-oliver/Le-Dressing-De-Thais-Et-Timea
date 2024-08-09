//
//  AboutUsView.swift
//  Furniture_app
//
//  Created by William on 09/08/2024.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Header Section
            Text("À propos de nous")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
                .padding(.horizontal)
                .foregroundColor(Color.primary)
            
            // Content Section
            ScrollView {
                Text("Notre entreprise est dédiée à fournir des meubles de haute qualité qui allient fonctionnalité et design moderne. Nous croyons que chaque pièce de mobilier doit non seulement embellir votre espace mais aussi enrichir votre quotidien. Avec une attention particulière aux détails et un engagement envers l'excellence, nous nous efforçons de surpasser vos attentes.")
                    .font(.body)
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .foregroundColor(Color.primary)
            }
            
            Spacer()
        }
        .navigationBarTitle("À propos de nous", displayMode: .inline)
        .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all))
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
