//
//  ProductCardView.swift
//  Furniture_app
//
//  Created by William on 09/08/2024.
//

import SwiftUI

struct ProductCardViewTest: View {
    var image: Image
    var size: CGFloat
    var title: String = "Nom du produit"
    var price: String = "$99.99"
    
    var body: some View {
        VStack {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipped()
            
            Text(title)
                .font(.headline)
                .foregroundColor(.black) // Couleur du texte en noir
            
            Text(price)
                .font(.subheadline)
                .foregroundColor(.black) // Couleur du texte en noir
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(image: Image("chair_1"), size: 180)
    }
}
