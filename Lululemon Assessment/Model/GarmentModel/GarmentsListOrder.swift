//
//  GarmentsListOrder.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 08/06/22.
//

import Foundation

enum GarmentsListOrder: Int {
    case alphabetical
    case creationTime
    
    static func getOrdering(from index: Int) -> GarmentsListOrder {
        return GarmentsListOrder.init(rawValue: index) ?? .alphabetical
    }
}
