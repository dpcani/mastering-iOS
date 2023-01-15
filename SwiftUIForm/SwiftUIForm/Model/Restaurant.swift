//
//  Restaurant.swift
//  SwiftUIForm
//
//  Created by Marble Interactive SL on 15/1/23.
//

import Foundation

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var phone: String
    var image: String
    var priceLevel: Int
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}
