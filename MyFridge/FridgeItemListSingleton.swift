		//
//  Fridge.swift
//  MyFridge
//
//  Created by leo dorbes on 06/03/2017.
//  Copyright © 2017 Léo Dorbes. All rights reserved.
//

import UIKit

class FridgeItemListSingleton {
    
    private var items: [FridgeItem]
    private var tenDaysItemsIndex : [Int] = []
    static var instance = FridgeItemListSingleton()
    
    private init() {
        items = []
    }
    
    func getElementAt(row : Int) -> FridgeItem{
        
        return self.items[row]
    }
    
    func getCount() -> Int {
        return self.items.count
    }
    
    func init10Days(){
        self.tenDaysItemsIndex = []
        let date = Date()
        var i = 0
        var dateComponent = DateComponents()
        dateComponent.day = 10
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: date)
        for item in items{
            i += 1
            print(i)
            if(item.getDate() < futureDate! && item.getDate() >= date){
                self.tenDaysItemsIndex.append(i)
            }
        }
    }
    
    func count10Days()-> Int {
        return self.tenDaysItemsIndex.count
    }
    
    func get10DaysAt(row : Int) -> FridgeItem{
        let index = tenDaysItemsIndex[row]
        return self.items[index - 1]
    }
    
    func removeAt(row : Int) {
        self.items.remove(at: row)
    }
    
    func add(item : FridgeItem){
        self.items.append(item)
    }

    func addCourseItems(){
        
        for i in 0 ..< CourseItemListSingleton.instance.getCount(){
            
            if(CourseItemListSingleton.instance.getElementAt(row: i).getState()){
                let f: FridgeItem = FridgeItem(name: CourseItemListSingleton.instance.getElementAt(row: i).getName() )
                FridgeItemListSingleton.instance.add(item: f)
            }
        }
        CourseItemListSingleton.instance.removeAll()
            
    }
}
