//
//  SettingStore.swift
//  SwiftUIForm
//
//  Created by Marble Interactive SL on 15/1/23.
//

import Foundation
import Combine

final class SettingStore: ObservableObject {
    init() {
        UserDefaults.standard.register(defaults: [
            "view.preferences.showCheckInOnly" : false,
            "view.preferences.displayOrder" : 0,
            "view.preferences.maxPriceLevel" : 5,
        ])
    }
    @Published var showCheckInOnly: Bool = UserDefaults.standard.bool(forKey: "view.preferences.showCheckInOnly") {
        didSet {
            UserDefaults.standard.set(showCheckInOnly, forKey: "view.preferences.showCheckInOnly")
        }
    }
    
    @Published var displayOrder: DisplayOrderType = DisplayOrderType(type: UserDefaults.standard.integer(forKey:  "view.preferences.displayOrder")) {
        didSet {
            UserDefaults.standard.set(displayOrder.rawValue, forKey: "view.preferences.displayOrder")
        }
    }
    
    @Published var maxPriceLevel: Int = UserDefaults.standard.integer(forKey: "view.preferences.maxPriceLevel") {
        didSet {
            UserDefaults.standard.set(maxPriceLevel, forKey: "view.preferences.maxPriceLevel")
        }
    }
}

enum DisplayOrderType: Int, CaseIterable {
    case alphabetical = 0
    case favorite = 1
    case checkInFirst = 2
    
    init(type: Int) {
        switch type {
        case 0: self = .alphabetical
        case 1: self = .favorite
        case 2: self = .checkInFirst
        default: self = .alphabetical
        }
    }
    var text: String {
        switch self {
        case .alphabetical: return "Alphabetical"
        case .favorite: return "Show Favorite First"
        case .checkInFirst: return "Show Check-i n First"
        }
    }
    
    func predicate() -> ((Restaurant, Restaurant) -> Bool) {
        switch self {
            case .alphabetical: return { $0.name < $1.name }
            case .favorite: return { ($0.isFavorite && !$1.isFavorite) }
            case .checkInFirst: return { $0.isCheckIn && !$1.isCheckIn }
        }
    }
}
