//
//  GridCell.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import SwiftUI

struct GridCell: View {
    
    @EnvironmentObject var viewModel: ProductsListViewModel
    
    @State var quantity: Int = 0
    
    var item: Product
    
    
    
    func addToCart(_ item: Product) {
        viewModel.addToCartIfNeeded(item)
    }
    
    
    var body: some View {
        NavigationLink {
            ProductDetailsScreen(item: item)
        } label: {
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray)
                        .cornerRadius(16)
                    
                    VStack {
                        AsyncImage(url: URL(string: item.images[0])) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 128, height: 84)
                                .shadow(color: Color.teal, radius: 3)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 86, height: 86)
                        }
                        HStack {
                            Text("Free shipping")
                                .font(Font.system(size: 12, design: .default))
                                .padding([.vertical], 4)
                                .padding([.horizontal], 12)
                                .background(.black)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            Spacer()
                        }
                        .padding([.vertical], 0)
                        .padding([.horizontal], 4)
                    }
                    .padding([.bottom], 0)
                    .padding([.top], 20)
                }
                .frame(width: 190, height: 150)
                
                HStack {
                    Text(item.title)
                        .foregroundColor(.black)
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    Text("$ \(item.price)")
                        .foregroundColor(.black)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .padding([.horizontal])
                
                Text(item.description)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .topLeading
                    )
                    .padding([.horizontal])
                Spacer()
                Button {
                    print("newValue")
                } label: {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .foregroundColor(.mint)
                        .frame(width: 18, height: 18)
                        .onTapGesture {
                            addToCart(item)
                        }
                    
                }
                
            }
            .frame(width: 196, height: 220)
            
        }
    }
    
}

struct GridCell_Previews: PreviewProvider {
        
    static var previews: some View {
        
        let item = Product(id: 1, title: "Headphones", description: "This is a headphone not from Apple aslf sklfh klsdhf lkasdjhf kasdjf", price: 133, discountPercentage: 14.5, rating: 4.7, stock: 100, brand: "Apple", category: "smartphone", thumbnail: "https://i.dummyjson.com/data/products/12/thumbnail.jpg", images: [
            "https://i.dummyjson.com/data/products/12/1.jpg", "https://i.dummyjson.com/data/products/12/2.jpg", "https://i.dummyjson.com/data/products/12/3.png", "https://i.dummyjson.com/data/products/12/4.jpg"
                                                                                                                                                                                                                                                                                                                                ])
        GridCell(item: item)
    }
}
