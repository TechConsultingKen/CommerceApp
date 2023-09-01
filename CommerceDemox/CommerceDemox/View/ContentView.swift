//
//  ContentView.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ProductsListViewModel
    
    @State var searchText: String = ""
    @State var hasError1: Bool = false
    @State var loading: Bool = true
    
    var leftText = NSLocalizedString("Hot_Sales", comment: "")
    var leftText2 = NSLocalizedString("New Items", comment: "")
    
    var body: some View {
        VStack{
            NavigationStack {
                ScrollView {
                    SearchBar(searchText: $searchText)
                    FiltersBar()
                    
                    SectionHeader(leftText: leftText, rightText: "See all")
                    if let product1 = viewModel.getProductsList(for: .defaultValue){
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: [GridItem(.flexible())]) {
                                ForEach(product1) { item in
                                    GridCell(item: item)
                                }.padding([.horizontal], 4)
                            }
                        }.task{
                            await viewModel.getDevicesResponseList(urlString: ApiManager.api())
                        }
                    }else {
                        Text(viewModel.customError?.localizedDescription ?? "Something went wrong.")
                    }
                    
                    SectionHeader(leftText: leftText2, rightText: "See all")
                    if let products2 = viewModel.getProductsList(for: .defaultValue) {
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: [GridItem(.flexible())]) {
                                ForEach(products2) { item in
                                    GridCell(item: item)
                                }.padding([.horizontal], 4)
                            }
                        }
                    }else {
                        Text(viewModel.customError?.localizedDescription ?? "Something went wrong.")
                    }
                }.refreshable {
                    await viewModel.getDevicesResponseList(urlString: ApiManager.api(.womensBags))
                }
                .redacted(reason: loading ? .placeholder: [])
                .onAppear {
                    loading = false
                }
            }
            
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView().environmentObject(ProductsListViewModel(networkManager: NetworkManager()))
    }
}
