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
var fightIsOver = false


class Game {
    
    func start() {
        
        welcome()
        teamCharacterSelection(team: firstTeam)
        teamCharacterSelection(team: secondTeam)
        fight(team1: firstTeam, team2: secondTeam)
        
    }
    // PRESENTATION
    private func welcome() {
        
        print("")
        print("******************************************  WELCOME  **************************************************")
        print("")
        print("The rules is simple:  2 teams of 3 characters are figthing until one the teams loose all its characters")
        print("")
        
    }
    
    //TEAM CHARACTERS SELECTION
    private func teamCharacterSelection(team: Team) {
        print("")
        print("***************************************** \(team.nameOfTeam) ***********************************************")
        print("")
        print("                          Please select 3 characters for the \(team.nameOfTeam)                               ")
        print("")
        createTeam(team: team)
        printTeamMembers(team: team)
    }
    
    
    
    
    private func createTeam(team: Team) {
        var characterCount = 0
        
        
        repeat {
            
            print("")
            print("********************************  \(team.nameOfTeam) CHARACTERS SELECTION \(characterCount + 1)/3  *************************************")
            print("")
            for (index, character) in chooseCharacters.enumerated(){
                print("\(index + 1). \(character.type) - Life: \(character.maxLife) / Attack: \(character.weapon.damage)")
                
            }
            print("")
            print("Please type in a number from 1 to 4 to select your character.")
            print("")
            
            
            
            if let chooseCharacter = readLine() {
                if let index = Int(chooseCharacter) {
                    
                    // Input range
                    if index > 0 && index <= 4{
                        
                        switch chooseCharacters[index - 1].type {
                        case "Warrior":  selectedCharacters.append(Warrior())
                        case "Magus":  selectedCharacters.append(Magus())
                        case "Colossus":  selectedCharacters.append(Colossus())
                        case "Dwarf":  selectedCharacters.append(Dwarf())
                        default: print("Something went wrong !")
                        }
                        
                        let lastCharacterSelected = selectedCharacters.last!
                        
                        
                        
                        print("**********************************************")
                        print(" You've selected the \(lastCharacterSelected.type)")
                        print("")
                        print("**********************************************")
                        print(" Please give him a name")
                        print("")
                        
                        // Name unicity
                        if let chosenName = chooseName() {
                            lastCharacterSelected.name = chosenName
                            characterCount += 1
                            dispatchCharacters(team: team, characterCount: characterCount, chosenCharacter: lastCharacterSelected)
                        }else {
                            print("This name has already been picked, please choose another one !")
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
    private func chooseName() -> String? {
        if let chosenName = readLine() {
            if charactersNames.contains(chosenName) {
                return nil
            }else{
                charactersNames.append(chosenName)
                return charactersNames[charactersNames.count-1]
            }
            
            
        }
        return nil
    }
    
    
    private func dispatchCharacters(team: Team, characterCount: Int, chosenCharacter: Character ) {
        
        team.members.append(chosenCharacter)
        print("")
        print("**********************************************")
        print("You've called your \(chosenCharacter.type): \(chosenCharacter.name)")
        
    }
    
    
    private func printTeamMembers(team: Team) {
        
        print("")
        print("***************  \(team.nameOfTeam)  ***************")
        for (index, member) in team.members.enumerated() {
            print("\(index + 1). \(member.name) the \(member.type) - \(member.life)PV")
        }
        
    }
    
    
    private func fight(team1: Team, team2: Team) {
        
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
            playersFighting = []
            isFightOver(team1: team1, team2: team2)
            
        } while fightIsOver != true
        
    }
    
    
    private func selectPlayerToFight(team1: Team, team2: Team) {
        
        let teams = [team1, team2]
        
        
        
        for team in teams {
            
            var teams = 0
            
            repeat {
                print("")
                print("***** PLAYER SELECTION: \(team.nameOfTeam) *****")
                print("Please select a number from 1 to \(team.members.count) in \(team.nameOfTeam) to select the character you use for the fight")
                
                if let input = readLine() {
                    if let index = Int(input) {
                        if index > 0 && index <= team.members.count  {
                            
                            
                            let characterSelected = team.members[index - 1]
                            if characterSelected.life > 0 {
                                playersFighting.append(characterSelected)
                                teams += 1
                            }else {
                                print("You cannot select this character because he's already dead !")
                            }
                            
                        }
                        
                        
                    } else {
                        print("")
                        print("We don't understand your choice, please type in a number from 1 to \(team.members.count) to choose a character !")
                    }
                }
            } while teams < 1
        }
        
        
        var hero = playersFighting[0]
        var villain = playersFighting[1]
        
        
        if rounds % 2 == 0 {
            hero = playersFighting[1]
            villain = playersFighting[0]
        }
        
        if hero.type == "Magus"{
            print("")
            print("********************* ROUND: \(rounds) *****************************")
            print("You've selected \(hero.name) the \(hero.type) - \(hero.maxLife)PV")
            
        }else{
            print("")
            print("********************* ROUND: \(rounds) *****************************")
            print("You've selected \(hero.name) the \(hero.type) \(hero.life)PV to fight against \(villain.name) the \(villain.type) \(villain.life)PV")
            
        }
        
    }
    
    
    
    
    
    
    
    private func attack(playersFighting: [Character], team1: Team, team2: Team) {
        
        var hero = playersFighting[0]
        var villain = playersFighting[1]
        var currentTeam = team1
        
        if rounds % 2 == 0 {
            hero = playersFighting[1]
            villain = playersFighting[0]
            currentTeam = team2
        }
        
        
        
        
        if hero.type == "Magus"
        {
            
            if rounds % 2 == 0 {
                heal(team: team2)
            }else {
                heal(team: team1)
            }
            
            
            
        }else {
            
            // Hero attacks villain
            print("")
            print("\(hero.name) is attacking ...")
            sleep(2)
            
            villain.life -= hero.weapon.damage
            
            if villain.life <= 0 {
                villain.life = 0
            }
            
            // Attack recap
            print("")
            print("************************* ROUND RECAP - \(currentTeam.nameOfTeam.uppercased()) *************************")
            if villain.life < 0{
                print("\(villain.name) the \(villain.type) has lost \(hero.weapon.damage)PV")
            }else{
                print("\(villain.name) the \(villain.type) is dead")
            }
            
            
            
        }
        
        
        
        
    }
    
    private func heal(team: Team) {
        
        var characterHealed = 0
        
        repeat {
            for character in team.members {
                if character.type == "Magus" {
                    print("")
                    print("************************* PLAYER TO HEAL *************************")
                    print("Please type in a number from 1 to \(team.members.count) to select the player you want to heal")
                    if let playerToHeal = readLine() {
                        
                        if let index = Int(playerToHeal) {
                            if index > 0 && index <= team.members.count {
                                
                                let playerHealed = team.members[index - 1]
                                
                                if playerHealed.life > 0 {
                                    print("")
                                    print("\(character.name) is healing ...")
                                    sleep(2)
                                    playerHealed.life += character.weapon.heal
                                    
                                    
                                    // Life does not exeed maxLife
                                    if    playerHealed.life >   playerHealed.maxLife {
                                        playerHealed.life =   playerHealed.maxLife
                                    }
                                    
                                    print("")
                                    print("You've healed \(playerHealed.name) the \(playerHealed.type), he now has  \(playerHealed.life)PV")
                                    characterHealed += 1
                                } else {
                                    print("You cannot heal this character because he's already dead !")
                                }
                                
                            }
                            
                        } else {
                            print("")
                            print("We don't understand your choice, please type in a number from 1 to \(team.members.count) to choose a character to heal !")
                        }
                    }
                }
            }
            
        } while characterHealed != 1
        
    }
    
    
    private func teamRecap(team1: Team, team2: Team) {
        
        let teams = [team1, team2]
        
        for team in teams {
            
            if team.members.contains(where: { $0.life > 0 }){
                print("")
                print("**************  \(team.nameOfTeam) ****************")
            }
            
            
            for (index, member) in team.members.enumerated() {
                
                // Recap only characters alive
                if member.life > 0{
                    print("\(index + 1). \(member.name) the \(member.type) - \(member.life)PV")
                }
                
            }
        }
    }
    
    
    
    private func isFightOver(team1: Team, team2: Team){
        
        let teams = [team1, team2]
        
        for team in teams{
            var characterDead = 0
            
            
            for character in team.members{
                if character.life == 0{
                    characterDead += 1
                    
                }
                if characterDead == 3 {
                    fightIsOver = true
                    let looser = team.nameOfTeam
                    print("")
                    print("*************** GAME OVER ***************")
                    if looser == team1.nameOfTeam {
                        print("\(team2.nameOfTeam) has won the fight")
                    }else{
                        print("\(team1.nameOfTeam) has won the fight")
                    }
                    
                }
            }
            
            
        }
        
        
    }
    
    
    
}




