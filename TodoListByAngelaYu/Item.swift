//
//  Item.swift
//  TodoListByAngelaYu
//
//  Created by Kumaran on 11/08/23.
//

import Foundation

class Item: Codable { //Encodable, Decodable {
    var title: String?
    var isSelected: Bool = false
    
    init(title: String) {
        self.title = title
    }
}
