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
    let maxLife: Int
    var weapon: Weapon
    
    
    init( type: String, name: String, life: Int, maxLife: Int, weapon: Weapon) {
        self.type = type
        self.name = name
        self.life = life
        self.maxLife = maxLife
        self.weapon = weapon
    }
}


