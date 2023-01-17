//
//  Restaurant.swift
//  SwiftUIForm
//
//  Created by Marble Interactive SL on 15/1/23.
//

import SwiftUI

@main
struct SwiftUIFormApp: App {
    var settingStore = SettingStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(settingStore)
        }
    }
}
