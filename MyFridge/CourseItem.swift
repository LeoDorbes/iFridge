//
//  ItemList.swift
//  MyFridge
//
//  Created by leo dorbes on 06/03/2017.
//  Copyright © 2017 Léo Dorbes. All rights reserved.
//

class CourseItem{
    
    var  name : String
    var  selected : Bool

    public init(n : String) {
        self.name = n
        self.selected = false
    }
    
    public func getName() -> String{
        return name
    }
    
    public func setName(n : String){
        self.name = n
    }
    public func switchstate(){
        if(self.selected == true){
            self.selected = false
        }
        else {
            self.selected = true
        }
        print(self.selected)
    }
    public func getState() -> Bool {
        return self.selected
    }
    
}
