//
//  ContentView.swift
//  SwiftUIActionSheet
//
//  Created by Marble Interactive SL on 17/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var restaurants = [
       Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
       Restaurant(name: "Homei", image: "homei"),
       Restaurant(name: "Teakha", image: "teakha"),
       Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
       Restaurant(name: "Petite Oyster", image: "petiteoyster"),
       Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
       Restaurant(name: "Po's Atelier", image: "posatelier"),
       Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
       Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
       Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
       Restaurant(name: "Homei", image: "upstate"),
       Restaurant(name: "Traif", image: "traif"),
       Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
       Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
       Restaurant(name: "Five Leaves", image: "fiveleaves"),
       Restaurant(name: "Cafe Lore", image: "cafelore"),
       Restaurant(name: "Confessional", image: "confessional"),
       Restaurant(name: "Barrafina", image: "barrafina"),
       Restaurant(name: "Donostia", image: "donostia"),
       Restaurant(name: "Royal Oak", image: "royaloak"),
       Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    

    var body: some View {
        List {
            ForEach(restaurants) { restaurant in
                BasicImageRow(restaurant: restaurant)
                    .contextMenu {
                        Button(action: {
                            self.delete(item: restaurant)
                        }) {
                            HStack {
                                Text("Delete")
                                Image(systemName: "trash")
                            }
                        }
                        Button(action: {}) {
                            HStack {
                                Text("Favorite")
                                Image(systemName: "star")
                            }
                        }
                    }
            }
            .onDelete { (indexSet) in
                self.restaurants.remove(atOffsets: indexSet)
            }
        }
        .listStyle(.plain)
    }
    
    private func delete(item resturant: Restaurant) {
        if let index = self.restaurants.firstIndex(where: { $0.id == resturant.id}) {
            self.restaurants.remove(at: index)
        }
    }
 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var image: String

}

struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}

