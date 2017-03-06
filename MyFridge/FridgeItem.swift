//
//  ItemList.swift
//  MyFridge
//
//  Created by leo dorbes on 06/03/2017.
//  Copyright © 2017 Léo Dorbes. All rights reserved.
//

class FridgeItem{
    
    var  name : String
    
    public init(n : String) {
        self.name = n
    }
    
    public func getName() -> String{
        return name
    }
    
    public func setName(n : String){
        self.name = n
    }
    
}
