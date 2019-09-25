//
//  ShoppingItem.swift
//  it16051980
//
//  Copyright © 2019 Tharushi De Silva. All rights reserved.
//

import UIKit

class ShoppingItem {
    var name: String
    var price: Float
    var description: String
    var imageURL: String
    
    init(name: String, price: Float, description: String, imageURL: String) {
        self.name = name
        self.price = price
        self.description = description
        self.imageURL = imageURL
    }
}
