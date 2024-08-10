import SwiftUI

struct FavoritesView: View {
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
            
            Text("Favoris")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            // Content for the Favorites view
            Text("Voici la page des favoris. Vous pouvez ajouter ici vos articles préférés.")
                .padding()
            
            Spacer()
        }
        .navigationBarTitle("Favoris", displayMode: .inline)
        .navigationBarBackButtonHidden(true) // Hide the default back button
    }
}

