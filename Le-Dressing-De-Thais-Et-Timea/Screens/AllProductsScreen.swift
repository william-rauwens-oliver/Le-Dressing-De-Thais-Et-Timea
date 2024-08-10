import SwiftUI

struct AllProductsScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    // Définir la disposition de la grille avec deux colonnes
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Utiliser la même couleur de fond que dans HomeScreen
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Nos vedettes :")
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
            }
            .navigationTitle("Tous nos produits")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left") // Icône de retour
                    .foregroundColor(.black) // Couleur de l'icône de retour
                    .padding()
            })
            .accentColor(.black) // Changer la couleur du texte de navigation en noir
        }
    }
}

struct AllProductsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AllProductsScreen()
    }
}
