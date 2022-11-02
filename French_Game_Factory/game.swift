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
var selectedCharacters: [Character] = []
var playersFighting: [Character] = []

class Game{
    
    func start(){
        
        welcome()
        teamCharacterSelection(team: firstTeam)
        teamCharacterSelection(team: secondTeam)
        fight(team1: firstTeam, team2: secondTeam)
        
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
            print("********************************  \(team.nameOfTeam) CHARACTERS SELECTION \(characterCount + 1)/3  *************************************")
            print("")
            for (index, character) in chooseCharacters.enumerated(){
                print("\(index + 1). \(character.type) - Life: \(character.maxLife) / Attack: \(character.weapon.damage)")
                
            }
            print("")
            print("Please type in a number from 1 to 4 to select your character.")
            print("")
            
            
            
            if let chooseCharacter = readLine(){
                if let index = Int(chooseCharacter){
                    
                    // Input range
                    if index > 0 && index <= 4{
                        
                        switch chooseCharacters[index - 1].type{
                        case "Warrior":  selectedCharacters.append(Warrior())
                        case "Magus":  selectedCharacters.append(Magus())
                        case "Colossus":  selectedCharacters.append(Colossus())
                        case "Dwarf":  selectedCharacters.append(Dwarf())
                        default: print("Something went wrong !")
                        }
                        
                        let lastCharacterSelected = selectedCharacters[selectedCharacters.count - 1]
                        
                        print("**********************************************")
                        print(" You've selected the \(lastCharacterSelected.type)")
                        print("")
                        print("**********************************************")
                        print(" Please give him a name")
                        print("")
                        lastCharacterSelected.name = chooseName()
                        
                        // Name unicity
                        if lastCharacterSelected.name == "nameAlreadyTook"{
                            print("This name has already been picked, please choose another one !")
                        }else{
                            characterCount += 1
                            dispatchCharacters(team: team, characterCount: characterCount, chosenCharacter: lastCharacterSelected)
                            
                        }
                        
                        
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
    func chooseName() -> String{
        var validateName: String = ""
        if let chosenName = readLine(){
            if charactersNames.contains(chosenName){
                validateName = "nameAlreadyTook"
            }else{
                charactersNames.append(chosenName)
                validateName = charactersNames[charactersNames.count-1]
            }
            
            
        }
        
        return validateName
        
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
    
    
    func fight(team1: Team, team2: Team){
        print("")
        print("****************** FIGHT *******************")
        print("You've successfully selected two teams: ")
        print("\(team1.nameOfTeam) and \(team2.nameOfTeam)")
        print("")
        print("We are now ready to fight")
        print("")
        print("****************** TEAMS RECAP *******************")
        printTeamMembers(team: team1)
        printTeamMembers(team: team2)
        
        // Mettre une boucle en place pour ajouter des perso au tabelau characters fighting
        // les deux perso se combattent le premier avec zero pv est supprimer du tableau fighting et team
        // on demande à l'équipe ayant perdu un perso d'en selectionner un autre
        // la première équipe avec zero perso dans son tableau perd
        // on imprime le vainqueur
        // le jeu est terminé
        selectPlayerToFight(team1: team1, team2: team2)
        
        
        
    }
    
    
    func selectPlayerToFight(team1: Team, team2: Team){
        print("")
        print("***** PLAYER SELECTION: \(team1.nameOfTeam) *****")
        print("Please type in the name of one of the character in \(team1.nameOfTeam)")
        
        if let input1 = readLine(){
            for player1 in team1.members{
                if input1 == player1.name{
                    playersFighting.append(player1)
                }
            }
        }
        
        print("")
        print("***** PLAYER SELECTION: \(team2.nameOfTeam) *****")
        print("Please type in the name of one of the character in \(team2.nameOfTeam)")
        if let input2 = readLine(){
            for player2 in team2.members{
                if input2 == player2.name{
                    playersFighting.append(player2)
                }
            }
        }
       
        let hero = playersFighting[0]
        let vilain = playersFighting[1]
        print("")
        print("**********************************************************************")
        print("You've selected \(hero.name) the \(hero.type) (\(hero.maxLife))PV to fight against \(vilain.name) the \(vilain.type) (\(hero.maxLife))PV")
    }
}

