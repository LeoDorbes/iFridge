//
//  ItemList.swift
//  MyFridge
//
//  Created by leo dorbes on 06/03/2017.
//  Copyright © 2017 Léo Dorbes. All rights reserved.
//

import UIKit

class CourseItemListSingleton {
    
    private var items: [CourseItem]
    
    static var instance = CourseItemListSingleton()
    
    private init() {
        items = []
    }
    
    func getElementAt(row : Int) -> CourseItem{
        
        return self.items[row]
    }
    
    func getCount() -> Int {
        return self.items.count
    }
    
    func removeAt(row : Int) {
        self.items.remove(at: row)
    }
    
    func add(item : ItemList){
        self.items.append(item)
    }
    
}
