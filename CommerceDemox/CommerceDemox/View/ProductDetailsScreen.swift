//
//  ProductDetailsScreen.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import SwiftUI

struct ProductDetailsScreen:  View {
    
    @EnvironmentObject var viewModel: ProductsListViewModel
    
    @State var selectedColor: Color = .clear
    @State var coupon = "AXDSFR"
    @State var isCouponAvailable: Bool = true
    @State var number: Int = 1
    @State var loading:Bool = true
    
    @State var item: Product
    
    var colors: [Color] = [
        Color(.black),
        Color(.black).opacity(0.50),
        Color(.black).opacity(0.20)
    ]
    
        
    var body: some View {
        let availableText = isCouponAvailable ? "Available" : "Unavailable"
        let couponImage = isCouponAvailable ? "checkmark.circle.fill" : "x.circle.fill"
        let couponColor = isCouponAvailable ? Color.purple : Color.red
        
        VStack {
            HeaderBarView(title: item.title)
            UserInfoBarView()
            ScrollView {
                ProductImageDetails(item: item)
                ProductDetails(item: item)
                
                
                HStack {
                    Text("$ \(item.price)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                    Spacer()
                    
                    HStack {
                        ForEach(colors, id: \.self) { color in
                            if selectedColor == color {
                                SelectedCircle(color: color)
                                    .onTapGesture {
                                        selectedColor = color
                                    
                                    }
                            }else {
                                NotSelectedCircle(color: color)
                                    .onTapGesture {
                                        selectedColor = color
            
                                    }
                            }
                        }
                    }
                    .padding([.horizontal])
                }
                
                HStack {
                    Text("Have a coupon code? enter here 👇")
                        .font(.caption)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .foregroundColor(.gray.opacity(0.75))
                    Spacer()
                }
                .padding([.horizontal])
                .padding([.top])
                .padding([.bottom], 4)
                
                VStack {
                    HStack {
                        Text(coupon)
                            .font(Font.system(size: 13, weight: .bold))
                            .padding(.leading, 5)
                        Spacer()
                        Text(availableText)
                            .font(Font.system(size: 13, weight: .bold))
                            .foregroundColor(couponColor)
                        Image(systemName: couponImage)
                            .foregroundColor(couponColor)
                            .padding(.trailing, 8)
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .inset(by: 1)
                            .stroke(Color(uiColor: .lightGray), lineWidth: 1)
                            .padding(.horizontal, 15)
                        )
                }
                Spacer()
            }
            .onAppear {
//                saveItemToRecents()
                selectedColor = colors[0]
            }
            .toolbar(.hidden)
            //MARK: - End of ScrollView
            
            VStack {
                HLine().doted(lineWidth: 1, dash: [0.1])
                    .frame(height: 2)
                    .foregroundColor(.gray)
                HStack {
                    Group {
                        HStack {
                            Button {
                                if number > 1 {
                                    number -= 1
//                                    item.quantity = number
//                                    viewModel.addToCart(item, quantity: number)
                                }
                            } label: {
                                Image(systemName: "minus.square")
                                    .resizable()
                                    .foregroundColor(.purple)
                            }
                            .foregroundColor(.mint)
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 9)
                            
                            Text("\(number)")
                                .padding([.vertical])
                                .font(.title3)
                                .bold()
                            
                            Button {
                                if number < 99 {
                                    number += 1
//                                    item.quantity = number
//                                    viewModel.addToCart(item, quantity: number)
                                }
                            } label: {
                                Image(systemName: "plus.app.fill")
                                    .resizable()
                                    .foregroundColor(.purple)
                            }
                            .foregroundColor(.purple)
                            .frame(width: 24, height: 24)
                            .padding(.leading, 9)
                        }
                    }
                    Spacer()
                    WideButton(text: "Continue") {
//                        addToCart(item)
                    }
                    .frame(width: 200)
                }
                .padding()
            }
            
        }.redacted(reason: loading ? .placeholder: [])
        .onAppear {
            
//            guard let currentitem = viewModel.cartList.first(where: {$0.id == item.id}) else {
//                number = 0
//                return
//            }
//            number = currentitem.quantity ?? 0
        }
    }
}
