//: Playground - noun: a place where people can play

import UIKit

//========= 1 ЗАДАНИЕ ===========

var str = "Hello, playground"

func trim (line: String, without: String) -> String {
    
    if line.contains(without) {
        var newString = (line.replacingOccurrences(of: without, with: ""))
        return newString
    }
    else {
        print("Такой подстроки нет")
    }
    return ""
}

print(trim(line: str, without: "l"))


//=========== 2 ЗАДАНИЕ ==========

class Unit {
    
    let name: String
    var health: Int
    var damage: Int
    var defence: Int
    var agility: Int
    let damageMultiplier = 4 / 2
    let defenceMultiplier = 1 / 2
    let agilityMultiplier = 3 / 2
    
    init(name: String, health: Int, damage: Int, defence: Int, agility: Int) {
        self.name = name
        self.health = health
        self.damage = damage
        self.defence = defence
        self.agility = agility
    }
    
    func attack(to enemy: Unit) {
        print("НЫААААААА, ДОМОООООЙ")
    }
}

class Magus: Unit {
    
    override func attack(to enemy: Unit) {
        
        enemy.health -= self.damage * damageMultiplier - enemy.defence
        
        print("\(self.name) кинул файерболл в \(enemy.name), нанеся \(self.damage * damageMultiplier  - enemy.defence) урона")
    }
}

class Knight: Unit {
    
    override func attack(to enemy: Unit) {
        
        enemy.health -= self.damage - enemy.defence * defenceMultiplier
        
        print("\(self.name) ударил топором в \(enemy.name), нанеся \(self.damage - enemy.defence * defenceMultiplier) урона")
    }
}

class Assassin: Unit {
    
    override func attack(to enemy: Unit) {
        enemy.health -= self.damage -  self.agility * agilityMultiplier + enemy.defence
        
        print("\(self.name) пырнул клинком \(enemy.name), нанеся \(self.damage -  self.agility * agilityMultiplier + enemy.defence) урона")
    }
}

class Battlefield{
    
    func beginBattle(with enemies: [Unit]) {
        
        var tempEnemies = enemies
        
        print("==========Битва началась!==========")
        
        while tempEnemies.count != 1 || tempEnemies.isEmpty {
            
            for i in 0 ..< (tempEnemies.count - 1) {
                if tempEnemies.count > 2 {
                    tempEnemies[i].attack(to: tempEnemies[i+1])
                    guard let first = tempEnemies.first, let last = tempEnemies.last else {
                        return
                    }
                    if tempEnemies[i+1].name == last.name {
                        tempEnemies[i+1].attack(to: first)
                    }
                }
                if tempEnemies.count == 2 {
                    if let first = tempEnemies.first, let last = tempEnemies.last {
                        first.attack(to: last)
                        last.attack(to: first)
                    }
                    
                }
                if tempEnemies[i].health <=  0 {
                    tempEnemies.remove(at: i)
                }
                if tempEnemies.count == 1 {
                    break
                }
            }
        }
        
        print("==========Битва закончилась!==========")
        print("Участники:")
        for i in 0 ..< enemies.count {
            print("\(enemies[i].name)")
        }
        print("")
        print("Победил \(tempEnemies[0].name)")
    }
}

var grandMagus = Magus(name: "Invoker", health: 70, damage:10, defence: 5, agility: 2)
var knigth = Knight(name: "DK", health: 100, damage:5, defence: 10, agility: 1)
var assassin = Assassin(name: "Ecio", health: 50, damage:15, defence: 1, agility: 3)
var battlefield = Battlefield()
var test: [Unit] = []
test.append(grandMagus)
test.append(knigth)
test.append(assassin)
battlefield.beginBattle(with: test)