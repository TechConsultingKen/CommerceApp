//
//  NetworkAbleProtocol.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import Foundation

protocol NetworkAbleProtocol {
    var networkDelegate: NetworkResponseProtocol? { get set }
        
    func getDataFromApi(urlRequest:URLRequest) async throws -> Data
    
}
