//
//  Item.swift
//  ToDo List
//
//  Created by Evgeniy Borovoy on 11/16/24.
//

import Foundation

struct Item: Identifiable, Codable {
    var id = UUID()
    
    var todo: String
}
