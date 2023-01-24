import SwiftUI

struct ContentView: View {
    @State private var showDetail = false
    @State private var selectedRestaurant: Restaurant?
    @State private var selectedDetent: PresentationDetent = .medium
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants) { restaurant in
                    BasicImageRow(restaurant: restaurant)
                        .onTapGesture {
                            self.showDetail = true
                            self.selectedRestaurant = restaurant
                        }
                }
            }
            .listStyle(.plain)
            
            .navigationTitle("Restaurants")
        }
        .sheet(item: $selectedRestaurant) { restaurant in
            RestaurantDetailView(restaurant: restaurant)
                .presentationDetents([.height(200), .medium, .large], selection: $selectedDetent)
                .presentationDragIndicator(.hidden)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
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

