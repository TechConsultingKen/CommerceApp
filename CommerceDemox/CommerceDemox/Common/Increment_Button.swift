//
//  Increment_Button.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//
//
//    import SwiftUI
//
//    struct Increment_Button: View {
//
//    @State var color: UIColor = .systemPurple
//    @State var number: Int = 1
//
//    var body: some View {
//        HStack {
//            ViewThatFits(in: .horizontal) {
//                Button {
//                    if number > 1 {
//                        number -= 1
//                    }
//                } label: {
//                    Image(systemName: "minus.square")
//                }
//                .foregroundColor(.purple)
//
//                Text("\(number)")
//                    .padding([.vertical])
//
//                Button {
//                    if number < 99 {
//                        number += 1
//                    }
//                } label: {
//                    Image(systemName: "plus.app.fill")
//                }
//                .foregroundColor(.purple)
//            }
//        }
//    }
//}
//
//    struct Increment_Button_Previews: PreviewProvider {
//        static var previews: some View {
//            Increment_Button()
//        }
//    }
//}
