//
//  SearchAndScanView.swift
//  Furniture_app
//
//  Created by William on 09/08/2024.
//

import Foundation

struct SearchAndScanView: View {
    @Binding var search: String
    @State private var selectedProduct: Product? = nil
    @State private var showProductDetail = false
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image("Search")
                        .padding(.trailing, 8)
                    TextField("Search Furniture", text: $search)
                }
                .padding(.all, 20)
                .background(Color.white)
                .cornerRadius(10.0)
                .padding(.trailing, 8)
                
                Button(action: {}) {
                    Image("Scan")
                        .padding()
                        .background(Color("Primary"))
                        .cornerRadius(10.0)
                }
            }
            .padding(.horizontal)
            
            if search.isEmpty == false {
                List(filteredProducts, id: \.id) { product in
                    Button(action: {
                        selectedProduct = product
                        showProductDetail = true
                    }) {
                        HStack {
                            Image(product.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                            Text(product.name)
                                .font(.headline)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .background(
            NavigationLink(
                destination: ProductDetailView(product: selectedProduct!),
                isActive: $showProductDetail,
                label: { EmptyView() }
            )
        )
    }
    
    private var filteredProducts: [Product] {
        if search.isEmpty {
            return []
        } else {
            return products.filter { $0.name.localizedCaseInsensitiveContains(search) }
        }
    }
}
