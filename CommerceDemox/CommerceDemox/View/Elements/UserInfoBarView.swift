//
//  UserInfoBarView.swift
//  CommerceDemox
//
//  Created by Consultant on 7/20/23.
//

import SwiftUI
struct Place: Identifiable {
    
    var uuid: String = UUID().uuidString
    var city: String
    var state: String
    var isShowing: Bool
    
    var id: String {
        self.uuid
    }
    
    init() {
        self.city = "city"
        self.state = "state"
        self.isShowing = false
    }
    
    init(city: String, state: String, isShowing: Bool) {
        self.city = city
        self.state = state
        self.isShowing = isShowing
    }
    
    func getPlaces() -> [Place] {
        [
            Place(city: "Fontana", state: "California", isShowing: false),
            Place(city: "Atlanta", state: "Georgia", isShowing: false),
            Place(city: "Pennsylvania", state: "Philadelphia", isShowing: false)
        ]
    }
}

struct UserInfoBarView: View {
    
    @State var place: String = "Fontana, California"
    @State var places: [Place] = Place().getPlaces()
    @State var x: Int = 0
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .foregroundColor(.purple)
                        .cornerRadius(16)
                    Image("")
                        .resizable()
                        .padding([.all], 2)
                }
                .frame(width: 36, height: 36, alignment: Alignment.center)
                Text("Kenneth Welbeck")
                    .font(.caption)
                    .fontWeight(.semibold)
                Spacer()
                HStack {
                    Menu {
                        ForEach(0...places.count-1, id: \.self) { index in
                            if x != index {
                                Button("\(places[index].city), \(places[index].state)") {
                                    places[index].isShowing.toggle()
                                    place = "\(places[index].city), \(places[index].state)"
                                    x = index
                                }
                            }
                            
                        }
                    } label: {
                        Text(place)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.purple)
                        Image(systemName: "chevron.down")
                            .foregroundColor(.purple)
                    }
                    .menuOrder(.fixed)
                }
            }
            .padding([.horizontal])
            Divider()
        }
        
    }
}

struct UserInfoBarView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoBarView()
    }
}
