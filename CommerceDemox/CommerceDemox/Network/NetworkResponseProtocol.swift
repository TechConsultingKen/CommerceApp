//
//  NetworkResponseProtocol.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import Foundation

protocol NetworkResponseProtocol {
    func didReceiveError(error: Error)
    func didReceivedDataFromAPI<T: Decodable>(data: T)
}
