//
//  DetailAlimentItem.swift
//  MyFridge
//
//  Created by Pierre Radiguet  on 06/03/2017.
//  Copyright © 2017 Alexia Longval. All rights reserved.
//

import UIKit

class DetailAlimentItem{
    
    var name : String
    var date  : Date
    
    
    public init(n : String, d : Date ){
        self.name = n
        self.date = d
        
    }
    
    public func getName() -> String{
        return name
    }
    
    public func getDate() -> Date{
        return date
    }

    public func setName(n : String){
        self.name = n
    }
    
    public func setDate(d : Date){
        self.date = d
    }
}
