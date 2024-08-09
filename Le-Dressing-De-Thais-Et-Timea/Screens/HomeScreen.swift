import SwiftUI

struct HomeScreen: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    @State private var isMenuOpen: Bool = false // Variable d'état pour le menu
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        
                        AppBarView(isMenuOpen: $isMenuOpen) // Passer l'état du menu ici
                        
                        SearchAndScanView(search: $search)
                        
                        NavigationLink(destination: AllProductsScreen()) {
                            Text("Tous nos produits")
                                .font(.custom("PlayfairDisplay-Bold", size: 20)) // Réduction de la taille de la police
                                .padding(.vertical, 10) // Réduction du padding vertical
                                .padding(.horizontal, 16) // Réduction du padding horizontal
                                .background(Color("Primary")) // Utilisation de la couleur principale
                                .foregroundColor(.white) // Couleur du texte en blanc pour un bon contraste
                                .cornerRadius(8.0) // Réduction du rayon des coins arrondis
                                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2) // Ombre légèrement réduite
                        }
                        .padding(.horizontal)
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(0 ..< 4) { i in
                                    NavigationLink(
                                        destination: DetailScreen(),
                                        label: {
                                            ProductCardView(image: Image("chair_\(i+1)"), size: 210)
                                        })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                }
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(0 ..< 4) { i in
                                    ProductCardView(image: Image("chair_\(4-i)"), size: 180)
                                }
                                .padding(.leading)
                            }
                        }
                        
                    }
                }
                
                // Menu déroulant
                if isMenuOpen {
                    HStack {
                        VStack(alignment: .leading) {
                            NavigationLink(destination: AboutUsView()) { // Redirige vers la page À propos de nous
                                Text("À propos de nous")
                                    .font(.system(size: 20))
                                    .padding(.top, 100)
                                    .foregroundColor(.black)
                            }
                            
                            Spacer()
                        }
                        .frame(width: 250)
                        .background(Color.white)
                        .edgesIgnoringSafeArea(.all)
                        
                        Spacer()
                    }
                    .background(Color.black.opacity(0.3).edgesIgnoringSafeArea(.all))
                    .onTapGesture {
                        withAnimation {
                            isMenuOpen.toggle()
                        }
                    }
                }
                
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct AppBarView: View {
    @Binding var isMenuOpen: Bool // Liaison pour le menu
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    isMenuOpen.toggle()
                }
            }) {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            // Titre entre le menu et la photo de profil
            VStack(spacing: 0) {
                Text("Le Dressing De Thaïs")
                    .font(.custom("PlayfairDisplay-Bold", size: 25))
                    .foregroundColor(Color("Primary"))
                
                Text("Et Timéa")
                    .font(.custom("PlayfairDisplay-Bold", size: 25))
                    .foregroundColor(Color("Primary"))
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(uiImage: #imageLiteral(resourceName: "Profile"))
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Rechercher", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)
            
            Button(action: {}) { // ici on peut retrouver les articles
                Image("Search")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
            if (isActive) { Color("Primary")
                .frame(width: 15, height: 2)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("Luxury Swedian chair").font(.title3).fontWeight(.bold)
            
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}

struct BottomNavBarView: View {
    var body: some View {
        HStack {
            BottomNavBarItem(image: Image("Home"), action: {})
            BottomNavBarItem(image: Image("av"), action: {})
            BottomNavBarItem(image: Image("Shop"), action: {})
            BottomNavBarItem(image: Image("User"), action: {})
        }
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}

// Nouvelle vue pour "À propos de nous"
struct AboutUsPageView: View {
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
