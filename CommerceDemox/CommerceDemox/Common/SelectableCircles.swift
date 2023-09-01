//
//  SelectableButtons.swift
//  CommerceDemox
//
//  Created by Consultant on 7/21/23.
//

import SwiftUI

struct SelectedCircle: View {
    
    @State var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 32, height: 32)
            Circle()
                .frame(width: 28, height: 28)
                .foregroundColor(color)
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .inset(by: 1)
                        .stroke(.white, lineWidth: 2)
                }
        }
    }
}

struct NotSelectedCircle: View {
    
    @State var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 28, height: 28)
                .foregroundColor(color)
        }
        .frame(width: 32, height: 32)
    }
}
