//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Marble Interactive SL on 2/2/23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        
        let persistenceController = PersistenceController.shared
        
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
