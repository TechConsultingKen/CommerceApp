//
//  NetworkManager.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import Foundation

class NetworkManager: NetworkAbleProtocol {
    
    var networkDelegate: NetworkResponseProtocol?
    
    func getDataFromApi(urlRequest:URLRequest) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            return data
        } catch {
            print(error.localizedDescription)
            throw NetworkError.dataNotFoundError
        }
    }
}

