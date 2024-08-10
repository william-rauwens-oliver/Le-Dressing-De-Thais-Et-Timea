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
    
    @State private var isFavorited: Bool = false

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size, height: size)
                    .clipped()
                
                Button(action: toggleFavorite) {
                    Text(isFavorited ? "⭐️" : "⭐️")
                        .font(.title)
                        .foregroundColor(.yellow)
                        .padding(8)
                }
                .background(Color.white.opacity(0.7))
                .clipShape(Circle())
                .padding(8)
            }
            
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
        .onAppear {
            // Vérifiez si le produit est déjà dans les favoris
            self.isFavorited = isProductFavorited()
        }
    }
    
    private func toggleFavorite() {
        if isFavorited {
            removeFromFavorites()
        } else {
            addToFavorites()
        }
        isFavorited.toggle()
    }

    private func addToFavorites() {
        var favorites = UserDefaults.standard.stringArray(forKey: "favoriteItems") ?? []
        let product = title // Utiliser le titre du produit pour l'identifier
        if !favorites.contains(product) {
            favorites.append(product)
            UserDefaults.standard.set(favorites, forKey: "favoriteItems")
        }
    }
    
    private func removeFromFavorites() {
        var favorites = UserDefaults.standard.stringArray(forKey: "favoriteItems") ?? []
        let product = title // Utiliser le titre du produit pour l'identifier
        if let index = favorites.firstIndex(of: product) {
            favorites.remove(at: index)
            UserDefaults.standard.set(favorites, forKey: "favoriteItems")
        }
    }

    private func isProductFavorited() -> Bool {
        let favorites = UserDefaults.standard.stringArray(forKey: "favoriteItems") ?? []
        return favorites.contains(title)
    }
}

struct ProductCardViewTest_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardViewTest(image: Image("chair_1"), size: 180)
    }
}
