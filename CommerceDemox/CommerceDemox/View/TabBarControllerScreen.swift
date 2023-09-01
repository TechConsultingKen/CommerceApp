//
//  TabBarControllerScreen.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import SwiftUI

struct TabBarControllerScreen: View {
    @EnvironmentObject var viewModel: ProductsListViewModel
   
    var body: some View {
        TabView {
            ContentView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            Text("Profile").tabItem {
                Image(systemName: "gearshape")
                Text("Profile")
            }
            
            Text("Wallet").tabItem {
                Image(systemName: "wallet.pass")
                Text("Wallet")
            }
            
            Text("Statistic").tabItem {
                Image(systemName: "chart.bar.xaxis")
                Text("Statistic")
            }
            
            MyCartScreen().tabItem {
                Image(systemName: "cart")
                Text("Cart")
                
            }
        }.accentColor(.purple)
    }
}

struct TabBarControllerScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        TabBarControllerScreen().environmentObject(ProductsListViewModel(networkManager: NetworkManager()))
        
    }

}
