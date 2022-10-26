//
//  Warrior.swift
//  French_Game_Factory
//
//  Created by Gary Foy on 26/10/2022.
//

import Foundation

class Warrior: Character {
    init(name: String){
        super.init( type: "Warrior", name: name, life: 50, maxLife: 50 )
    }
}
