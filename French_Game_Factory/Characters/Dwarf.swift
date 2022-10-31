//
//  Dwarf.swift
//  French_Game_Factory
//
//  Created by Gary Foy on 26/10/2022.
//

import Foundation

class Dwarf: Character {
    init(){
        super.init( type: "Dwarf", name: "", life: 25, maxLife: 25, weapon: Hammer() )
        
    }
}
