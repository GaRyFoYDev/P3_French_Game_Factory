//
//  game.swift
//  French_Game_Factory
//
//  Created by Gary Foy on 24/10/2022.
//

import Foundation

var firstTeam = Team(nameofTeam: "firstTeam")
var secondTeam = Team(nameofTeam: "secondTeam")
var charactersNames: [String] = []
var currentTeam = 0

class Game{
    
    func start(){
        
        welcome()
        firstTeamCharacterSelection()
        secondTeamCharacterSelection()
    }
    
    // PRESENTATION
    private func welcome(){
        
        print("")
        print("******************************************  WELCOME  **************************************************")
        print("")
        print("The rules is simple:  2 teams of 3 characters are figthing until one the teams loose all its characters")
        print("")
      
    }
    
    // FIRST TEAM CHARACTERS SELECTION
    private func firstTeamCharacterSelection(){
        print("")
        print("*****************************************  FIRST TEAM   ***********************************************")
        print("")
        print("                          Please select 3 characters for the first team                                ")
        print("")
        createTeam(team: firstTeam)
        printTeamMembers(team: firstTeam)
    }
    
    
    // SECOND TEAM CHARACTERS SELECTION
    private func secondTeamCharacterSelection(){
        print("")
        print("*****************************************  SECOND TEAM   **********************************************")
        print("")
        print("                          Please select 3 characters for the second team                               ")
        print("")
        createTeam(team: secondTeam)
        printTeamMembers(team: secondTeam)
        
    }
    
    
    func createTeam(team: Team){
        var characterCount = 0
        
        
        repeat {
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
                
                    characterCount += 1
                
                case "3":
                    print(" You've selected the Colossus")
                    print(" Please give him a name")
                    let characterName = chooseName()
                    let colossus = Colossus()
                    colossus.name = characterName
                    characterCount += 1
                    dispatchCharacters(team: team, characterCount: characterCount, chosenCharacter: colossus)
                
                    characterCount += 1
                
                case "4":
                    print(" You've selected the Dwarf")
                    print(" Please give him a name")
                    let characterName = chooseName()
                    let dwarf = Warrior()
                    dwarf.name = characterName
                    characterCount += 1
                    dispatchCharacters(team: team, characterCount: characterCount, chosenCharacter: dwarf)
                
                    characterCount += 1
                
                    
                default:
                    print("We don't understand your choice, please type a number from 1 to 4 to choose a character !")
                    
                }
                
                
                
            }
           
           
            
        } while (characterCount < 4)
        
        
    
    }

    // Unique character's name verification
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
        
        if characterCount == 1 { team.member1 = chosenCharacter}
        else if characterCount == 2 { team.member2 = chosenCharacter}
        else if characterCount == 3 { team.member3 = chosenCharacter}
        print("You've called your \(chosenCharacter.type): \(chosenCharacter.name)")
        
    }
    
    
    
    func printTeamMembers(team: Team){
        print("***************\(team.nameOfTeam)***************")
        print("1. \(team.member1!.name) the \(team.member1!.type)")
        print("2. \(team.member2!.name) the \(team.member2!.type)")
        print("3. \(team.member3!.name) the \(team.member3!.type)")
    }
    

    
   
    
    
}
    
