//
//  GridCellButton.swift
//  CommerceDemox
//
//  Created by Consultant on 7/25/23.
//

import SwiftUI


struct GridCellButton: View {
    
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
//                    Rectangle()
//                        .foregroundColor(Color(hex: "F1F1F1", alpha: 1.0))
//                        .cornerRadius(16)
                    VStack {
                        AsyncImage(url: URL(string: item.images[0])) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 186, height: 146)
                                .padding(0)
                                .padding([.top], -15)
                                .background(.green)
//                                .cornerRadius(0, corners: .topLeft)
//                                .cornerRadius(0, corners: .topRight)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 186, height: 146)
                        }
                    }
                    
                    VStack {
                        Spacer()
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
                        .padding([.horizontal], 8)
                    }
                    .padding([.bottom], 8)
                    .padding([.top], 20)
                }
                .frame(width: 190, height: 150)

                HStack {
                    Text(item.title)
                        .font(.caption)
                        .fontWeight(.semibold)
                    Spacer()
                    Image(systemName: "heart.circle")
                   
                }
                .padding([.horizontal])
                
                Text(item.description)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding([.horizontal])
                
                HStack {
                    Text("$ \(item.price)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Spacer()
                    Button {
                        print("newValue")
                    } label: {
                        Image(systemName: "plus.app.fill")
                            .resizable()
                            .foregroundColor(.purple)
                            .frame(width: 18, height: 18)
                            .onTapGesture {
                                addToCart(item)
                            }
                    }
                }
                .padding()
                
            }
            
        }
        .frame(width: 196, height: 280)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .inset(by: 1)
//                .stroke(Color(hex: "d0d0d0", alpha: 0.9), lineWidth: 0.4)
                .shadow(
                    color: .gray,
                    radius: 2
                )
        }
        
    }
}
