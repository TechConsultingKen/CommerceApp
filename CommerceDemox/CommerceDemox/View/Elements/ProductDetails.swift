//
//  ProductDetails.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import SwiftUI

struct ProductDetails: View {
    @EnvironmentObject var viewModel: ProductsListViewModel
    
    @State var item: Product
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .foregroundColor(.black.opacity(0.75))
                
                Text(item.description)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
            }
        }
    }
}


struct ProductDetails_Previews: PreviewProvider {
    @State static var item = ProductsResponse.getTheSound()[1]
    static var previews: some View {
        ProductDetails(item: item)
    }
}
