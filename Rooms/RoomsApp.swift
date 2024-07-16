//
//  RoomsApp.swift
//  Rooms
//
//  Created by Mustafa TAVASLI on 16.07.2024.
//

import SwiftUI

@main
struct RoomsApp: App {
    
    // If we use ValueTransformer, we have to add this.
    init() {
        ValueTransformer.setValueTransformer(UIColorValueTransformer(), forName: NSValueTransformerName("UIColorValueTransformer"))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Room.self])
        }
    }
}
