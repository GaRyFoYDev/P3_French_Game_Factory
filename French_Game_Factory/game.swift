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
var rounds = 1

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
    
   // Implémenter le fait que si la vie d'un perso est à zéro il ne peut pas combattre
    func fight(team1: Team, team2: Team){
        
        print("")
        print("****************** FIGHT *******************")
        print("You've successfully selected two teams: ")
        print("It is now time to fight")
        print("")
        print("****************** TEAMS RECAP *******************")
        printTeamMembers(team: team1)
        printTeamMembers(team: team2)
        
        
        repeat {
           
            selectPlayerToFight(team1: team1, team2: team2)
            attack(playersFighting: playersFighting, team1: team1, team2: team2)
            teamRecap(team1: team1, team2: team2)
            rounds += 1

            
        }while team1.members.count > 0  || secondTeam.members.count > 0
        
        printWinners(team1: team1, team2: team2)
        
        
    }
    
   
    func selectPlayerToFight(team1: Team, team2: Team){
        
        let teams = [team1, team2]
        
        
        for team in teams{
            
            print("")
            print("***** PLAYER SELECTION: \(team.nameOfTeam) *****")
            print("Please select a number from 1 to \(team.members.count) in \(team.nameOfTeam) to select the character you use for the fight")
            
            if let input = readLine(){
                if let index = Int(input){
                    if index > 0 && index <= team.members.count{
                        playersFighting.append(team.members[index - 1])
                    }
                }else {
                    print("We don't understand your choice, please type in a number from 1 to \(team.members.count) to choose a character !")
                }
                
                
            }
            
        }
        
        let hero = playersFighting[0]
        let villain = playersFighting[1]
        print("")
        print("********************* ROUND: \(rounds) *****************************")
        print("You've selected \(hero.name) the \(hero.type) \(hero.maxLife)PV to fight against \(villain.name) the \(villain.type) \(hero.maxLife)PV")
    }
    
    
    
    
    func attack(playersFighting: [Character], team1: Team, team2: Team){
        
        var hero = playersFighting[0]
        var villain = playersFighting[1]
        
       
        if rounds % 2 == 0 {
            hero = playersFighting[1]
            villain = playersFighting[0]
        }
        
        
        // hero attacks villain
        print("")
        print("\(hero.name) is attacking ...")
        sleep(2)
        
        if hero.type != "Magus"
        {
            villain.life -= hero.weapon.damage
            
            if villain.life < 0{
                villain.life = 0
            }
            
            // Round recap
            print("")
            print("************************* ROUND RECAP *************************")
            print("\(villain.name) the \(villain.type) has lost \(hero.weapon.damage)PV")
           
            
        }else{
            if rounds % 2 == 0{
                heal(team: team1)
            }else{
                heal(team: team2)
            }
        }
        
        if villain.life == 0{
            print("\(villain.name) the \(villain.type) is dead")
        }
        
        
        
    }
    
    func heal(team: Team){
        for character in team.members{
            if character.type == "Magus"{
                if let playerToHeal = readLine(){
                    print("Please type in a number from 1 to \(team.members.count) to select the player you want to heal")
                    if let index = Int(playerToHeal){
                        if index > 0 && index <= team.members.count{
                            team.members[index - 1].life += character.weapon.heal
                            
                            // Life does not exeed maxLife
                            if  team.members[index - 1].life >  team.members[index - 1].maxLife{
                                team.members[index - 1].life =  team.members[index - 1].maxLife
                            }
                        }
                        
                    }
                }
            }
        }
    }
    
    
    // Modifier la fonction pour ne plus supprimer de perso du tableau
    /*func verifyLife(team: Team){
        
        for (index, member) in team.members.enumerated(){
            if member.life == 0{
                team.members.remove(at: index)
            }
        }
    } */
    
    func printWinners(team1 :Team, team2: Team) {
        if team1.members.count == 0{
            print("The \(team1.nameOfTeam) has won the fight")
        }else if team2.members.count == 0{
            print("The \(team2.nameOfTeam) has won the fight")
        }
    }
    
    
    func teamRecap(team1: Team, team2: Team){
        let teams = [team1, team2]
        
        for team in teams{
            print("")
            print("**************  \(team.nameOfTeam) ****************")
            
            for member in team.members{
                print("\(member.name) the \(member.type) - \(member.life)PV")
            }
        }
    }
    
}




