//
//  Person.swift
//  swift-data-demo
//
//  Created by ABALi Mohammed Amine on 04/02/2025.
//

import Foundation
import SwiftData

@Model
class Person: Identifiable {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
