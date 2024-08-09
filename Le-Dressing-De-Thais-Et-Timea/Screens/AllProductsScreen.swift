import SwiftUI

struct AllProductsScreen: View {
    // Définir la disposition de la grille avec deux colonnes
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Tous nos produits")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .padding(.horizontal)
                    
                    // Utiliser LazyVGrid pour la disposition en colonnes
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0 ..< 8) { i in
                            // NavigationLink pour chaque produit
                            NavigationLink(destination: DetailScreen()) {
                                ProductCardView(image: Image("chair_\(i % 4 + 1)"), size: 180)
                            }
                            .accentColor(.black)  // Changer la couleur du texte du lien en noir
                        }
                    }
                    .padding(.horizontal)
                    
                    // Ajoutez plus de contenu ici si nécessaire
                }
            }
            .navigationTitle("Tous nos produits")
            .accentColor(.black) // Changer la couleur du texte de navigation en noir
        }
    }
}

struct AllProductsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AllProductsScreen()
    }
}
