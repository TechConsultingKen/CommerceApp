//
//  ProductListViewModel.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import Foundation

@MainActor
class ProductsListViewModel: ObservableObject {
    @Published var productsResponseList: [String:ProductsResponse] = [:]
    @Published var customError: NetworkError?
    @Published var cartList = [Product]()
    @Published var subTotal: Int = 0
    
    var networkManager: NetworkAbleProtocol
    
    init(networkManager: NetworkAbleProtocol) {
        self.networkManager = networkManager
    }
    
    func getDevicesResponseList(urlString: String, for newList: ProductResponseKeyName = ProductResponseKeyName.defaultValue) async{
        guard let url = URL(string: urlString) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        do {
            let data = try await networkManager.getDataFromApi(urlRequest: urlRequest)
            productsResponseList[newList.rawValue] = try JSONDecoder().decode(ProductsResponse.self, from: data)
        }catch {
            
        }
    }
    
    func getProductsList(for category: ProductResponseKeyName = ProductResponseKeyName.defaultValue) -> [Product]? {
        productsResponseList[category.rawValue]?.products
    }
    func addToCartIfNeeded(_ product: Product) {
        if cartList.firstIndex(where: { $0.id == product.id }) != nil {
            calculateTotal()
            return
        }
        appendNew(product: product, and: 1)
        calculateTotal()
    }
    
    func addToCart(_ product: Product, quantity: Int) {
        if cartList.firstIndex(where: { $0.id == product.id }) != nil {
            updateQuantity(for: product.id, with: quantity)
            calculateTotal()
            return
        }
        appendNew(product: product, and: quantity)
        calculateTotal()
    }
    
    private func appendNew(product: Product, and quantity: Int) {
        var newItem = product
        newItem.quantity = quantity
        cartList.append(newItem)
        calculateTotal()
    }
    
    private func updateQuantity(for itemID: Int, with newvalue: Int) {
        guard let index = cartList.firstIndex(where: {$0.id == itemID}) else {
            return
        }
        var newItem = cartList[index]
        newItem.quantity = newvalue
        cartList[index] = newItem
        calculateTotal()
    }
    
    func deleteFromCart(_ product: Product) {
        guard let index = cartList.firstIndex(where: { $0.id == product.id }) else {
            return
        }
        _ = cartList.dropFirst(index)
    }
    
    private func calculateTotal() {
        var sum = 0
        for item in cartList {
            sum = sum + (item.price * (item.quantity ?? 0))
        }
        subTotal = sum
        
    }
}
