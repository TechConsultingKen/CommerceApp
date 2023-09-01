//
//  MyCartScreen.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import SwiftUI

struct MyCartScreen: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: ProductsListViewModel
    
    @State var items = ProductsResponse.getTheSound()
    @State var coupon = "AXDSFR"
    @State var isCouponAvailable: Bool = true
    @State var subTotal:Int = 0
    @State var loading:Bool = true
    let paymentManager = PaymentManager()
    
    var body: some View {
        let availableText = isCouponAvailable ? "Available" : "Unavailable"
        let couponImage = isCouponAvailable ? "checkmark.circle.fill" : "x.circle.fill"
        let couponColor = isCouponAvailable ? Color.purple : Color.red
        
        VStack {
            HeaderBarView(title: "My Cart")
            UserInfoBarView()
                .padding([.top], 8)
            ScrollView {
                VStack {
                    if viewModel.cartList.count != 0 {
                        ForEach(viewModel.cartList) { item in
                            CartListCellView(item: item)
                        }.onChange(of: viewModel.cartList.count) { newValue in
                            
                        }
                                .padding([.horizontal])
                            Divider()
                    }else {
                        Text(viewModel.customError?.localizedDescription ?? "Something went wrong.")
                    }
                    
                    
                    HStack {
                        Text("Have a coupon code? enter here 👇")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding([.horizontal])
                    .padding([.top])
                    .padding([.bottom], 4)
                    
                    VStack {
                        HStack {
                            Text(coupon)
                                .font(Font.system(size: 16, weight: .bold))
                            Spacer()
                            Text(availableText)
                                .bold()
                                .foregroundColor(couponColor)
                                .font(Font.system(size: 11))
                            Image(systemName: couponImage)
                                .foregroundColor(couponColor)
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .inset(by: 1)
                                .stroke(Color(uiColor: .lightGray), lineWidth: 1)
                        )
                        CartData(leftText: "Subtotal:", rightText: "$\(subTotal).00")
                        
                        CartData(leftText: "Delivery Fee:", rightText: "$ 5.00")
                            .padding(.top, 1)
                        CartData(leftText: "Discount:", rightText: "0%")
                            .padding(.top, 1)
                            .padding(.bottom, 6)
                        
                        HLine().stroked()
                        let total = (subTotal)
                        CartDataTotal(leftText: "Total:", rightText: "$\(total).00").padding(.top, 5)
                    }
                    .padding([.horizontal])
                }
                .toolbar(.hidden)
            }
            WideButton(text: "ApplePay") {
                paymentManager.UpdatePaymentRequest(viewModel: viewModel)
                paymentManager.payNowButtonClicked(completion:{ success in print(success)} )
            }
            .padding([.horizontal])
            .padding([.bottom])
        
        }.redacted(reason: loading ? .placeholder: [])
        .onAppear {
            subTotal = viewModel.subTotal
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            loading = false
            }
}
        .onChange(of: viewModel.subTotal){ newValue in
            subTotal = viewModel.subTotal
        }
    }
}

struct MyCartScreen_Previews: PreviewProvider {
    static var previews: some View {
        MyCartScreen().environmentObject(ProductsListViewModel(networkManager: NetworkManager()))
    }
}
