//
//  CommerceDemoxApp.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import SwiftUI

@main
struct CommerceDemoxApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarControllerScreen().environmentObject(ProductsListViewModel(networkManager: NetworkManager()))
        }
    }
}


