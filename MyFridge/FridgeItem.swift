//
//  ItemList.swift
//  MyFridge
//
//  Created by leo dorbes on 06/03/2017.
//  Copyright © 2017 Léo Dorbes. All rights reserved.
//
import Foundation
class FridgeItem{
    
    var  name : String
    var  date = Date()
    var  isDateSetted = false
    public init(name : String) {
        self.name = name
    }
    
    public func getName() -> String{
        return name
    }
    
    public func setName(n : String){
        self.name = n
    }
    
    public func setDate(d : Date){
        self.date = d
        isDateSetted = true
    }
    
    public func getDate() -> Date{
        return date
    }
    
    public func isSet() -> Bool {
        return isDateSetted
    }
    
    
}
