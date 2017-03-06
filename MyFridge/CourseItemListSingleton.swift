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
    
    func add(item : CourseItem){
        self.items.append(item)
    }
    
    func switchState(row : Int){
        self.items[row].switchstate()
    }
    
    func isSelected(row : Int) -> Bool{
        return self.items[row].getState()
    }
    
    func removeAll(){
        items.removeAll()
    }
}
