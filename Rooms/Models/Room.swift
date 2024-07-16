//
//  Room.swift
//  Rooms
//
//  Created by Mustafa TAVASLI on 16.07.2024.
//

import Foundation
import SwiftData
import UIKit

@Model
class Room {
    var name : String
    @Attribute(.transformable(by: UIColorValueTransformer.self)) var color : UIColor
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
}
