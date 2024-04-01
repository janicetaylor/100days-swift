//
//  Person.swift
//  Day59Challenge
//
//  Created by Janice on 3/28/24.
//

import Foundation
import UIKit

class Person: NSObject, Codable {
    
    var name: String
    var phone: String
    
    init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
}
