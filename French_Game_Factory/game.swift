//
//  game.swift
//  French_Game_Factory
//
//  Created by Gary Foy on 24/10/2022.
//

import Foundation

var firstTeam = Team(nameofTeam: "FIRST TEAM ")
var secondTeam = Team(nameofTeam: "SECOND TEAM")
var charactersNames: [String] = []
let chooseCharacters = [Warrior(), Magus(), Colossus(), Dwarf()]


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
            print("********************************  \(team.nameOfTeam) CHARACTERS SELECTION   *************************************")
            print("")
            for (index, character) in chooseCharacters.enumerated(){
                print("\(index + 1). \(character.type) - Life: \(character.maxLife) / Attack: \(character.weapon.damage)")
                
            }
            print("")
            print("Please type in a number from 1 to 4 to select your \(characterCount + 1)/3 character.")
            print("")
            
            
    
            if let chooseCharacter = readLine(){
                if let index = Int(chooseCharacter){
                    if index > 0 && index <= 4{
                        let characterSelected = chooseCharacters[index - 1]
                        print("**********************************************")
                        print(" You've selected the \(characterSelected.type)")
                        print("")
                        print("**********************************************")
                        print(" Please give him a name")
                        print("")
                        characterSelected.name = chooseName()
                        characterCount += 1
                        dispatchCharacters(team: team, characterCount: characterCount, chosenCharacter: characterSelected)
                    }else {
                        print("Please only type in a number from 1 to 4 to choose a character !")
                    }
                }else{
                        print("We don't understand your choice, please type in a number from 1 to 4 to choose a character !")
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
        print("")
        print("**********************************************")
        print("You've called your \(chosenCharacter.type): \(chosenCharacter.name)")
        
    }
    
    
    
    func printTeamMembers(team: Team){
        print("")
        print("***************  \(team.nameOfTeam)  ***************")
        for (index, member) in team.members.enumerated() {
            print("\(index + 1). \(member.name) the \(member.type)")
        }
        
        
       
    }
    

    
   
    
    
}
    
