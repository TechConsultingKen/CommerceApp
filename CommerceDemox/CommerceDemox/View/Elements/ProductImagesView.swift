//
//  ProductImagesView.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import SwiftUI

struct ProductImagesView: View {
    @EnvironmentObject var viewModel: ProductsListViewModel
    
    @State var item: Product
    @Binding var imageSelected: String
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                AsyncImage(url: URL(string: imageSelected)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: .infinity, height: 200)
                        .padding(0)
                } placeholder: {
                    ProgressView()
                        .frame(width: .infinity, height: 200)
                }
                Spacer()
            }
            .background(.white)
            .frame(width: .infinity)
            
            HStack {
                Spacer()
                VStack {
                    ScrollView {
                        ForEach(item.images, id: \.self) { imageUrl in
                            ZStack {
                                AsyncImage(url: URL(string: imageUrl)) { image in
                                    image
                                        .resizable()
                                        .frame(width: 64, height: 64, alignment: .trailing)
                                        .cornerRadius(8)
                                        .opacity(
                                            imageSelected != imageUrl
                                            ? 0.55
                                            : 1.0
                                        )
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .inset(by: 1)
                                                .stroke(imageSelected != imageUrl ? .clear : .mint, lineWidth: 1)
                                                .shadow(
                                                    color: .mint,
                                                    radius: 2
                                                )
                                        }
                                    
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 64, height: 64, alignment: .trailing)
                                        .cornerRadius(8)
                                }
                                .onTapGesture {
                                    imageSelected = imageUrl
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            
        }
        .onAppear {
            imageSelected = item.images[0]
        }
        .frame(width: .infinity, height: 200)
    }
    
}

struct ProductImageDetails: View {
    
    @State var item: Product
    @State var isFavorite: Bool = false
    @State var imageSelected: String = ""
    
    var body: some View {
        
        let favoriteColor: Color = isFavorite ? .purple : .gray
        VStack {
            
            ProductImagesView(item: item, imageSelected: $imageSelected)
                .padding(.bottom, 7)
            Group {
                HStack {
                    Text("Free shipping")
                        .font(Font.system(size: 11, design: .default))
                        .padding([.vertical], 4)
                        .padding([.horizontal], 12)
                        .background(.purple)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                    Spacer()
                    Image(systemName: "heart.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding([.horizontal])
                        .foregroundColor(favoriteColor)
                        .onTapGesture {
                            isFavorite.toggle()
                        }
                }
                .padding([.vertical], 0)
                .padding([.horizontal], 8)
            }
            
        }
        .padding([.bottom], 8)
        .padding([.top], 0)
        .frame(width: .infinity)
    }
}
