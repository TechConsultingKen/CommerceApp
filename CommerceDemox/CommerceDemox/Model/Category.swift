//
//  Category.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import Foundation

// MARK: - Devices
struct ProductsResponse: Codable {
    
    let products: [Product]
    let total, skip, limit: Int
    
    static func getTheSound() -> [Product] {
        [
            Product(id: 1, title: "iPhone 4", description: "This is a headphone not from Apple", price: 135, discountPercentage: 5.45, rating: 3.4, stock: 150, brand: "Apple", category: "smartphones", thumbnail: "https://i.dummyjson.com/data/products/2/thumbnail.jpg", images: ["https://i.dummyjson.com/data/products/1/1.jpg", "https://i.dummyjson.com/data/products/1/2.jpg", "https://i.dummyjson.com/data/products/1/3.jpg", "https://i.dummyjson.com/data/products/1/4.jpg", "https://i.dummyjson.com/data/products/1/thumbnail.jpg"]),
            
            Product(id: 2, title: "Iphone 3GS", description: "This is a headphone not from Apple", price: 135, discountPercentage: 5.45, rating: 4.9, stock: 78, brand: "Apple", category: "smartphones", thumbnail: "https://i.dummyjson.com/data/products/3/2.jpg", images: ["https://i.dummyjson.com/data/products/3/1.jpg", "https://i.dummyjson.com/data/products/1/3.jpg", "https://i.dummyjson.com/data/products/3/3.jpg", "https://i.dummyjson.com/data/products/3/4.jpg", "https://i.dummyjson.com/data/products/3/thumbnail.jpg"])
        ]
    }
    
    
    static func getTheProcess() -> [Product] {
        [
            Product(id: 1, title: "iMac 11", description: "This is a headphone not from Apple", price: 135, discountPercentage: 5.45, rating: 5, stock: 10, brand: "Apple", category: "smartphones", thumbnail: "https://i.dummyjson.com/data/products/4/thumbnail.jpg", images: ["https://i.dummyjson.com/data/products/1/1.jpg", "https://i.dummyjson.com/data/products/1/2.jpg", "https://i.dummyjson.com/data/products/1/3.jpg", "https://i.dummyjson.com/data/products/1/4.jpg", "https://i.dummyjson.com/data/products/1/thumbnail.jpg"]),
            Product(id: 2, title: "Macbook Pro 14", description: "This is a headphone not from Apple", price: 135, discountPercentage: 5.45, rating: 5, stock: 65, brand: "Apple", category: "smartphones", thumbnail: "https://i.dummyjson.com/data/products/9/thumbnail.jpg", images: [
                "https://i.dummyjson.com/data/products/9/1.jpg", "https://i.dummyjson.com/data/products/4/2.png", "https://i.dummyjson.com/data/products/9/3.png", "https://i.dummyjson.com/data/products/9/4.jpg", "https://i.dummyjson.com/data/products/9/thumbnail.jpg"])
        ]
    }
    
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    var quantity: Int?
    
}


enum CategoryFilt: String {
    case headphone = "Headphones"
    case earphone = "Earphones"
    case headset = "Headset"
    
    case laptop = "lenovo"
    case macbookAir = "macair"
    case macbookPro13 = "macpro-13"
    case macbookPro14_16 = "macpro-14-16"

}


struct CategoryFilter: Identifiable {
    
    var uuid: String = UUID().uuidString

    var image: String
    var category: CategoryFilt
    
    var id: String {
        return self.uuid
    }
    
    static func getCategories() -> [CategoryFilter] {
        [
            CategoryFilter(image: "headphone-1", category: .headphone),
            CategoryFilter(image: "earphone-1", category: .earphone),
            CategoryFilter(image: "headset-1", category: .headset)
        ]
    }
}

