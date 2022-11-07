//
//  Dwarf.swift
//  French_Game_Factory
//
//  Created by Gary Foy on 26/10/2022.
//

import Foundation

class Dwarf: Character {
    init() {
        super.init( type: "Dwarf", name: "", life: 30, maxLife: 30, weapon: Hammer() )
        
    }
}
