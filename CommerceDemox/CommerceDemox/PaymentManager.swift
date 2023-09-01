//
//  PaymentManager.swift
//  CommerceDemox
//
//  Created by Consultant on 8/14/23.
//

import Foundation
import PassKit
import SwiftUI

class PaymentManager:NSObject{
    @EnvironmentObject var viewModel: ProductsListViewModel
    var paymentStatus = PKPaymentAuthorizationStatus.failure
 
    
    private var paymentRequest : PKPaymentRequest = PKPaymentRequest()
    
    typealias PaymentManagerCompletion = (Bool) ->Void
    var completionHandler: PaymentManagerCompletion?
    
    func payNowButtonClicked(completion: @escaping PaymentManagerCompletion){
        self.completionHandler = completion
        if PKPaymentAuthorizationController.canMakePayments(usingNetworks: [.masterCard,.amex,.visa]){
            let paymentAuthorizationController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
        
                paymentAuthorizationController.delegate = self
                paymentAuthorizationController.present { value in
                    
                }
        }
    }
    
    func UpdatePaymentRequest(viewModel: ProductsListViewModel){
            let request = PKPaymentRequest()
            
            request.merchantIdentifier = "merchant.com.ba.ApplePayPasskit"
            
            request.supportedNetworks = [.masterCard,.amex,.visa]
            request.supportedCountries = ["US","GB","IN","ER"]
            request.merchantCapabilities = .capability3DS
            
            request.countryCode = "US"
            request.currencyCode = "USD"
            
            request.requiredShippingContactFields = [.name,.emailAddress,.phoneNumber,.postalAddress]
        
            request.paymentSummaryItems = []
            var total:Int = 0
            viewModel.cartList.forEach { product in
            total += product.price
            request.paymentSummaryItems.append(PKPaymentSummaryItem(label: product.title, amount: NSDecimalNumber(value: product.price)))
            
        }
        var totalItem = PKPaymentSummaryItem(label: "Total Item", amount: NSDecimalNumber(value: total))
        request.paymentSummaryItems.append(totalItem)
        paymentRequest = request
    }
}
    
extension PaymentManager:PKPaymentAuthorizationControllerDelegate{
        func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
            DispatchQueue.main.async{
                if self.paymentStatus == .success{
                    self.completionHandler!(true)
                }else{
                    self.completionHandler!(false)
                }
            }
        }
        
        func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {
            if payment.shippingContact?.emailAddress == nil || payment.shippingContact?.phoneNumber == nil {
                self.paymentStatus = .failure
            }else{
                self.paymentStatus = .success
            }
            completion(paymentStatus)
        }
    }
