//
//  Character.swift
//  French_Game_Factory
//
//  Created by Gary Foy on 26/10/2022.
//

import Foundation

class Character{
    var type: String
    var name: String
    var life: Int
    
    
    init( type: String, name: String, life: Int) {
        self.type = type
        self.name = name
        self.life = life
    }
}


