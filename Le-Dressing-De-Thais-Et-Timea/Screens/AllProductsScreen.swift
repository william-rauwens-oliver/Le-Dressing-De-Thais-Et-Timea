import SwiftUI

struct AllProductsScreen: View {
    // Définir la disposition de la grille avec deux colonnes
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Tous nos produits")
                    .font(.custom("PlayfairDisplay-Bold", size: 24))
                    .padding(.horizontal)
                
                // Utiliser LazyVGrid pour la disposition en colonnes
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0 ..< 8) { i in
                        ProductCardView(image: Image("chair_\(i % 4 + 1)"), size: 180)
                    }
                }
                .padding(.horizontal)
                
                // Ajoutez plus de contenu ici si nécessaire
            }
        }
        .navigationTitle("Tous nos produits")
    }
}

struct AllProductsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AllProductsScreen()
    }
}
