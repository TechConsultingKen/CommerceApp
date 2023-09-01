//
//  SectionHeader.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import SwiftUI

struct SectionHeader: View {
    
    @State var leftText: String
    @State var rightText: String
    
    var body: some View {
        HStack {
            Text(leftText)
                .fontWeight(.bold)
                .font(Font.system(size: 14, design: .rounded))
            
            
            Spacer()
            Text(rightText)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .font(Font.system(size: 12, design: .rounded))
        }
        .padding([.horizontal])
    }
}


struct CartData: View {
    
    @State var leftText: String
    @State var rightText: String
    
    var body: some View {
        HStack {
            Text(leftText)
                .fontWeight(.bold)
                .font(Font.system(size: 12, design: .rounded))
                .foregroundColor(.gray)
            
            
            Spacer()
            Text(rightText)
                .fontWeight(.bold)
                .font(Font.system(size: 12, design: .rounded))
        }
        .padding([.horizontal])
    }
}

struct CartDataTotal: View {
    
    @State var leftText: String
    @State var rightText: String
    
    var body: some View {
        HStack {
            Text(leftText)
                .fontWeight(.bold)
                .font(Font.system(size: 12, design: .rounded))
                .foregroundColor(.gray)
            
            
            Spacer()
            Text(rightText)
                .fontWeight(.bold)
                .font(Font.system(size: 16, design: .rounded))
                .foregroundColor(.purple)
        }
        .padding([.horizontal])
    }
}

