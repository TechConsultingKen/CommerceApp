//
//  FiltersBar.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import SwiftUI

struct FiltersBar: View {

    let rows = [GridItem(.flexible())]
    
    var body: some View {
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                
                Image(systemName: "slider.horizontal.3")
                    .frame(width: 20, height: 20)
                    .font(.system(size: 26))
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                                .inset(by: 1)
                                .stroke(.gray.opacity(0.1), lineWidth: 1)
                    )
    
                ForEach(CategoryFilter.getCategories()) { item in
                    HStack {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.gray.opacity(0.1))
                                .cornerRadius(9)
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .padding([.all], 6)
                        }
                        
                        Text(item.category.rawValue)
                            .font(Font.system(size: 13, design: .rounded))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                    }
                    
                    .padding([.horizontal], 17)
                    .padding([.vertical], 15)
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                    .inset(by: 9)
                                    .stroke(.gray.opacity(0.1), lineWidth: 1)
                        )
                }
            }
        }
        .padding([.horizontal], 16)
        .padding([.vertical], 0)
        Divider()
            .padding([.vertical],5)
    }
    
}

struct FiltersBar_Previews: PreviewProvider {
    static var previews: some View {
        FiltersBar()
    }
}

