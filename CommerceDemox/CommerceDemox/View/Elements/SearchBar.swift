//
//  SearchBar.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "chevron.backward")
                .padding()
                .imageScale(.large)
                .frame(width: 36, height: 36)
            Spacer()
            
            HStack {
                TextField("Search for a product, cloth, etc.", text: $searchText)
                    .font(.system(.subheadline))
                    .fontWeight(.medium)
                    .font(Font.system(size: 18, design: .monospaced))
                
                    .padding([.trailing], 0)
                    .padding([.leading], 16)
                    .padding([.vertical], 16)
                    .background(Color.gray.opacity(0.07))
                Image(systemName: "magnifyingglass")
                    .padding([.trailing], 12)
                    .foregroundColor(.gray)
            }
            .foregroundColor(.black)
            .cornerRadius(8)
        }.padding(4)
    }
}

struct SearchBar_Previews: PreviewProvider {
    
    @State static var searchText: String =  "Custom Text"
    
    static var previews: some View {
        SearchBar(searchText: $searchText)
    }
}
