//
//  ApiManager.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//
import Foundation

struct ApiManager {
    
    private static let api = "https://dummyjson.com/products/"
    
    static func api(_ category: Category? = nil) -> String {
        guard let cat = category else {
            return api
        }

        let path = api + cat.getString()
        return path
    }

}

enum Category {
    case smartphones
    case laptops
    case fragrances
    case skincare
    case groceries
    case homeDecoration
    case furniture
    case tops
    case womensDresses
    case womensShoes
    case mensShirts
    case mensShoes
    case mensWatches
    case womensWatches
    case womensBags
    case womensJewellery
    case sunglasses
    case automotive
    case motorcycle
    case lighting
    case search(text: String)
    
    
    
    func getString() -> String {
        var newValue = "category/"
        switch self {
        case .smartphones:
            newValue += "smartphones"
        case .laptops:
            newValue += "laptops"
        case .fragrances:
            newValue += "fragrances"
        case .skincare:
            newValue += "skincare"
        case .groceries:
            newValue += "groceries"
        case .homeDecoration:
            newValue += "home-decoration"
        case .furniture:
            newValue += "furniture"
        case .tops:
            newValue += "tops"
        case .womensDresses:
            newValue += "womens-dresses"
        case .womensShoes:
            newValue += "womens-shoes"
        case .mensShirts:
            newValue += "mens-shirts"
        case .mensShoes:
            newValue += "mens-shoes"
        case .mensWatches:
            newValue += "mens-watches"
        case .womensWatches:
            newValue += "womens-watches"
        case .womensBags:
            newValue += "womens-bags"
        case .womensJewellery:
            newValue += "womens-jewellery"
        case .sunglasses:
            newValue += "sunglasses"
        case .automotive:
            newValue += "automotive"
        case .motorcycle:
            newValue += "motorcycle"
        case .lighting:
            newValue += "lighting"
        case .search(let text):
            newValue = "search?q=\(text)"
        }
        return newValue
    }
}
