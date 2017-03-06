//
//  ItemList.swift
//  MyFridge
//
//  Created by leo dorbes on 06/03/2017.
//  Copyright © 2017 Léo Dorbes. All rights reserved.
//

import UIKit

class ItemListSingleton {
    
    public var elements
    
    static let list = ItemListSingleton()
    
    private init() {
        elements = ItemList()
    }
    
    
}
