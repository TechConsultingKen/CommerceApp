//
//  CartListCellView.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import SwiftUI

struct CartListCellView: View {
    @EnvironmentObject var viewModel: ProductsListViewModel
    
    @State var item: Product
    @State var number: Int = 1
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 96, height: 96)
                        .foregroundColor(.gray)
                        .cornerRadius(8)
                        
                    
                    AsyncImage(url: URL(string: item.images[0])) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 86, height: 86)
                            .padding([.all], 8)
                            .shadow(color: Color.cyan, radius: 3)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 86, height: 86)
                    }
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.caption)
                            .fontWeight(.bold)
                            .lineLimit(1)
                        
                        Text(item.description)
                            .font(.caption)
                            .fontWeight(.none)
                            .lineLimit(2)
                            .foregroundColor(Color(uiColor: .lightGray))
                        
                        Text("$ \(item.price)")
                            .font(.title3)
                            .fontWeight(.heavy)
                            .lineLimit(1)
                            .padding([.top], 4)
                    }
                    
                    Spacer()
                    VStack {
                        Spacer()
                        HStack {
                            Button {
                                if number > 1 {
                                    number -= 1
                                }
                            } label: {
                                Image(systemName: "minus.square")
                            }
                            .foregroundColor(.purple)

                            Text("\(number)")
                                .padding([.vertical])
                            
                            Button {
                                if number < 99 {
                                    number += 1
                                    item.quantity = number
                                    viewModel.addToCart(item, quantity: number)
                                }
                            } label: {
                                Image(systemName: "plus.app.fill")
                            }
                            .foregroundColor(.purple)
                        }
                        
                    }
                }
            }
//            Divider()
        }
        .alignmentGuide(.listRowSeparatorLeading) { d in
            d[.leading] - 140
        }
        .onAppear {
            guard let currentitem = viewModel.cartList.first(where: {$0.id == item.id}) else {
                number = 0
                return
            }
            number = currentitem.quantity ?? 0
        }.onChange(of: viewModel.cartList.count) { numberOfItems in
            guard let currentitem = viewModel.cartList.first(where: {$0.id == item.id}) else {
                number = 0
                return
            }
            number = currentitem.quantity ?? 0
        }

    }
}

struct CartListCellView_Previews: PreviewProvider {
    @State static var item = ProductsResponse.getTheSound()[1]
    
    static var previews: some View {
        CartListCellView(item: item)
    }
}

   
