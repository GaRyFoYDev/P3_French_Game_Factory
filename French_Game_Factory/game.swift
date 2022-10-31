//
//  game.swift
//  French_Game_Factory
//
//  Created by Gary Foy on 24/10/2022.
//

import Foundation

var firstTeam = Team(nameofTeam: "First Team ")
var secondTeam = Team(nameofTeam: "Seecond Team")
var charactersNames: [String] = []


class Game{
    
    func start(){
       
        welcome()
        teamCharacterSelection(team: firstTeam)
        //teamCharacterSelection(team: secondTeam)
       
    }
    // PRESENTATION
    func welcome(){
        
        print("")
        print("******************************************  WELCOME  **************************************************")
        print("")
        print("The rules is simple:  2 teams of 3 characters are figthing until one the teams loose all its characters")
        print("")
      
    }
    
    //TEAM CHARACTERS SELECTION
    func teamCharacterSelection(team: Team){
        print("")
        print("***************************************** \(team.nameOfTeam) ***********************************************")
        print("")
        print("                          Please select 3 characters for the \(team.nameOfTeam)                               ")
        print("")
        createTeam(team: team)
        printTeamMembers(team: team)
    }
    
 
    
    
    func createTeam(team: Team){
        var characterCount = 0
        
        
        repeat {
            // Refacto avec un tableau de personnage , transformer string en int , characters[chooseCharacter]
            print("")
            print("************************************  CHARACTERS SELECTION   ******************************************")
            print("")
            print(" 1. Warrior - Life: \(Warrior().maxLife) / Attack: \(Sword().damage)   ")
            print(" 2. Magus - Life: \(Magus().maxLife) / Heal: \(Wand().heal)   ")
            print(" 3. Colossus - Life: \(Colossus().maxLife) / Attack: \(Fist().damage)   ")
            print(" 4. Dwarf - Life: \(Dwarf().maxLife) / Attack: \(Hammer().damage)   ")
            print("")
            print("Please type a number from 1 to 4 to choose a character")
            print("")
            
            
            
            if let chooseCharacter = readLine(){
                
                switch chooseCharacter{
                case "1":
                    print(" You've selected the Warrior")
                    print(" Please give him a name")
                    let characterName = chooseName()
                    let warrior = Warrior()
                    warrior.name = characterName
                    characterCount += 1
                    dispatchCharacters(team: team, characterCount: characterCount, chosenCharacter: warrior)
                
                case "2":
                    print(" You've selected the Magus")
                    print(" Please give him a name")
                    let characterName = chooseName()
                    let magus = Magus()
                    magus.name = characterName
                    characterCount += 1
                    dispatchCharacters(team: team, characterCount: characterCount, chosenCharacter: magus)
                
               
                
                case "3":
                    print(" You've selected the Colossus")
                    print(" Please give him a name")
                    let characterName = chooseName()
                    let colossus = Colossus()
                    colossus.name = characterName
                    characterCount += 1
                    dispatchCharacters(team: team, characterCount: characterCount, chosenCharacter: colossus)
                
                   
                
                case "4":
                    print(" You've selected the Dwarf")
                    print(" Please give him a name")
                    let characterName = chooseName()
                    let dwarf = Warrior()
                    dwarf.name = characterName
                    characterCount += 1
                    dispatchCharacters(team: team, characterCount: characterCount, chosenCharacter: dwarf)
                
                    
                
                    
                default:
                    print("We don't understand your choice, please type a number from 1 to 4 to choose a character !")
                    
                }
                
                
                
            }
           
           
            
        } while (characterCount < 3)
        
        
    
    }

    // Unique character's name verification
    // Modifier la fonction pour qu'elle me redemande s'il est déja pris
    func chooseName() -> String{
        var chosenName: String
        var validatedName = ""
        chosenName = readLine()!
       
        
        if (charactersNames.count == 0){
             validatedName = chosenName
            
        } else {
            
            for name in charactersNames{
                if name == chosenName {
                    print("This name has already been picked")
                } else{
                    
                    validatedName = chosenName
                }
            }
            
            
        }
        
        charactersNames.append(validatedName)
        return validatedName
    }
    
    
    func dispatchCharacters(team: Team, characterCount: Int, chosenCharacter: Character ){
        
        team.members.append(chosenCharacter)
        
        print("You've called your \(chosenCharacter.type): \(chosenCharacter.name)")
        
    }
    
    
    
    func printTeamMembers(team: Team){
        
        print("***************  \(team.nameOfTeam)  ***************")
        for (index, member) in team.members.enumerated() {
            print("\(index + 1). \(member.name) the \(member.type)")
        }
        
        
       
    }
    

    
   
    
    
}
    
