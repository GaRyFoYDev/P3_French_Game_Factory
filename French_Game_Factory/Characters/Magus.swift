//
//  Magus.swift
//  French_Game_Factory
//
//  Created by Gary Foy on 26/10/2022.
//

import Foundation

class Magus: Character {
    init(){
        super.init( type: "Magus", name: "", life: 100, maxLife: 100, weapon: Wand() )
    }
}
