//
//  ProductDetailView.swift
//  Furniture_app
//
//  Created by William on 09/08/2024.
//

import Foundation

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(product.name)
                .font(.largeTitle)
                .padding()
            
            Text(product.price)
                .font(.title)
                .foregroundColor(.gray)
                .padding(.bottom)
            
            Spacer()
        }
        .navigationBarTitle("Product Details", displayMode: .inline)
    }
}
