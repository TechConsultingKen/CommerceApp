//
//  WideButton.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import SwiftUI

struct WideButton: View {
    
    @State var text: String
    @State var color: UIColor = .systemPurple
    @State var number: Int = 1
    
    let action: () -> Void
    
    var body: some View {
        HStack {
            ViewThatFits(in: .horizontal) {
                Button {
                    action()
                } label: {
                    Text(text)
                        .font(Font.system(size: 20, weight: .semibold))
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            }
            .foregroundColor(.white)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.purple)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white, lineWidth: 0.5)
            )
        }
    }
}

struct WideButton_Previews: PreviewProvider {
    
    static var previews: some View {
        WideButton(text: "Button", color: UIColor.systemPurple, action: {
            print("Button pressed")
        })
    }
}
