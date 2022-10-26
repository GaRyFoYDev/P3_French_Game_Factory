//
//  Colossus.swift
//  French_Game_Factory
//
//  Created by Gary Foy on 26/10/2022.
//

import Foundation

class Colossus: Character {
    init(name: String){
        super.init( type: "Colossus", name: name, life: 75, maxLife: 75, weapon: Fist() )
    }
}

