//
//  ItemList.swift
//  MyFridge
//
//  Created by leo dorbes on 06/03/2017.
//  Copyright © 2017 Léo Dorbes. All rights reserved.
//

import UIKit

class ItemListSingleton {
    
    private var itemList: [ItemList]
    
    static var instance = ItemListSingleton()
    
    private init() {
        itemList = []
    }
    
    func getElementAt(row : Int) -> ItemList{
        
        return self.itemList[row]
    }
    
    func getCount() -> Int {
        return self.itemList.count
    }
    
    func removeAt(row : Int) {
        self.itemList.remove(at: row)
    }
    
    func add(item : ItemList){
        self.itemList.append(item)
    }
    
}
