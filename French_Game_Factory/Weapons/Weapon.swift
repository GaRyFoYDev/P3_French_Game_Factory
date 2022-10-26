//
//  Weapon.swift
//  French_Game_Factory
//
//  Created by Gary Foy on 26/10/2022.
//

import Foundation

class Weapon {
    var name: String
    var damage: Int
    var heal: Int
    
    init(name: String, damage: Int, heal: Int){
        self.name = name
        self.damage = damage
        self.heal = heal
    }
}
