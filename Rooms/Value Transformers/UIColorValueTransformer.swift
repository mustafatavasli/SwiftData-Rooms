//
//  UIColorValueTransformer.swift
//  Rooms
//
//  Created by Mustafa TAVASLI on 16.07.2024.
//

import Foundation
import UIKit

class UIColorValueTransformer : ValueTransformer {
    
    // Return Data
    override func transformedValue(_ value: Any?) -> Any? {
        
        guard let color = value as? UIColor else { return nil }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
            return data
        } catch {
            return nil
        }
    }
    // Return UIColor
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        
        guard let data = value as? Data else { return nil }
        
        do {
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
            return color
        } catch {
            return nil
        }
    }
}
