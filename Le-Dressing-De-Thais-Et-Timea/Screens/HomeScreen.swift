import SwiftUI

struct HomeScreen: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    @State private var isMenuOpen: Bool = false
    @State private var cartItemCount: Int = 3
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        
                        AppBarView(isMenuOpen: $isMenuOpen, cartItemCount: cartItemCount)
                        
                        SearchAndScanView(search: $search)
                        
                        NavigationLink(destination: AllProductsScreen().navigationBarBackButtonHidden(true)) {
                            Text("Tous nos produits")
                                .font(.custom("PlayfairDisplay-Bold", size: 20))
                                .padding(.vertical, 10)
                                .padding(.horizontal, 16)
                                .background(Color("Primary"))
                                .foregroundColor(.white)
                                .cornerRadius(8.0)
                                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                        }
                        .padding(.horizontal)
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(0 ..< 4) { i in
                                    NavigationLink(
                                        destination: DetailScreen().navigationBarBackButtonHidden(true),
                                        label: {
                                            ProductCardView(image: Image("chair_\(i+1)"), size: 210)
                                        })
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
                
                if isMenuOpen {
                    HStack {
                        VStack(alignment: .leading) {
                            NavigationLink(destination: AboutUsPageView().navigationBarBackButtonHidden(true)) {
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
            .navigationBarBackButtonHidden(true) // Hide back button on HomeScreen
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct AppBarView: View {
    @Binding var isMenuOpen: Bool
    var cartItemCount: Int
    
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
            
            VStack(spacing: 0) {
                Text("Le Dressing De Thaïs")
                    .font(.custom("PlayfairDisplay-Bold", size: 25))
                    .foregroundColor(Color("Primary"))
                
                Text("Et Timéa")
                    .font(.custom("PlayfairDisplay-Bold", size: 25))
                    .foregroundColor(Color("Primary"))
            }
            
            Spacer()
            
            NavigationLink(destination: FavoritesView().navigationBarBackButtonHidden(true)) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 42, height: 42)
                        .foregroundColor(Color("Primary"))
                        .cornerRadius(10.0)
                    
                    if cartItemCount > 0 {
                        Text("\(cartItemCount)")
                            .font(.caption)
                            .foregroundColor(Color("Primary"))
                            .padding(6)
                            .clipShape(Circle())
                            .offset(x: 4, y: -12)
                    }
                }
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
            
            Button(action: {}) {
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
            if isActive {
                Color("Primary")
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
    
    @State private var isFavorited: Bool = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                image
                    .resizable()
                    .frame(width: size, height: 200 * (size/210))
                    .cornerRadius(20.0)
                
                Button(action: toggleFavorite) {
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(.primary)
                        .padding(8)
                }
                .background(Color.white.opacity(0.7))
                .clipShape(Circle())
                .padding(8)
            }
            
            Text("Luxury Swedian chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack {
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
        .onAppear {
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
        let product = "Luxury Swedian chair"
        if !favorites.contains(product) {
            favorites.append(product)
            UserDefaults.standard.set(favorites, forKey: "favoriteItems")
        }
    }
    
    private func removeFromFavorites() {
        var favorites = UserDefaults.standard.stringArray(forKey: "favoriteItems") ?? []
        let product = "Luxury Swedian chair"
        if let index = favorites.firstIndex(of: product) {
            favorites.remove(at: index)
            UserDefaults.standard.set(favorites, forKey: "favoriteItems")
        }
    }

    private func isProductFavorited() -> Bool {
        let favorites = UserDefaults.standard.stringArray(forKey: "favoriteItems") ?? []
        return favorites.contains("Luxury Swedian chair")
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

struct AboutUsPageView: View {
    @Environment(\.presentationMode) var presentationMode // To access the presentation mode for dismissal

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Dismiss the view
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            Text("À propos de nous")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Voici la page À propos de nous. Vous pouvez ajouter ici des informations sur votre entreprise, votre mission, votre équipe, etc.")
                .padding()
            
            Spacer()
        }
        .navigationBarTitle("À propos de nous", displayMode: .inline)
        .navigationBarBackButtonHidden(true) // Hide the default back button
    }
}
