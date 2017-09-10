//: Playground - noun: a place where people can play

import UIKit

//========= 1 ЗАДАНИЕ ===========

var str = "Hello, playground"

func trim (with string: String, with subString: String) -> String{
    
    if string.contains(subString){
        var newString = (string.replacingOccurrences(of: subString, with: ""))
        return newString
    }
    else{
        print("Такой подстроки нет")
    }
    return ""
}

print(trim(with: str, with: "l"))

/*  ========== ЭТО ТОЖЕ РАБОТАЕТ ===========
func test3(with str: String, with subStr: String) -> Int{
    
    var char1 = Array(str.characters)
    var char2 = Array(subStr.characters)
    var count = 0
    
    if str.contains(subStr){
        for i in 0 ..< char1.count{
            if char1[i] != char2[0]{continue}
            for j in 0 ..< char2.count{
                if (i+j < char1.count) && (char1[i+j] == char2[j]){
                    count += 1
                }
                else{
                    break
                }
            }
            if (count == char2.count) {return i}
            else {count = 0}
        }
    } else {
        print("такой подстроки нет")
    }
    return 123
}


func test4(with str: String, with subStr: String){
    
    
    let temp = test3(with: str, with: subStr)
    
    var char1 = Array(str.characters)
    var char2 = Array(subStr.characters)
    
    for j in 0 ..< char1.count{
        for i in temp ..< temp + char2.count{
            char1[i] = " "
        }
    }
    
    var newChar1 = String(char1)
    if newChar1.contains(subStr){
        test4(with: newChar1, with: subStr)
    }
    print(newChar1)
}

test4(with: str, with: "o")*/

//=========== 2 ЗАДАНИЕ ==========

class Unit {
    
    let name: String
    var health: Int
    var damage: Int
    var defence: Int
    var agility: Int
    
    init(name: String, health: Int, damage: Int, defence: Int, agility: Int) {
        self.name = name
        self.health = health
        self.damage = damage
        self.defence = defence
        self.agility = agility
    }
    
    func attack(to enemy: Unit){
        print("НЫААААААА")
    }
}

class Magus: Unit {
    
    override func attack(to enemy: Unit) {
        
            enemy.health -= self.damage * 3 / 2  - enemy.defence
            
            print("\(self.name) кинул файерболл в \(enemy.name), нанеся \(self.damage * 3 / 2  - enemy.defence) урона")
    }
}

class Knight: Unit{
    
    override func attack(to enemy: Unit) {
            
            enemy.health -= self.damage - enemy.defence * 1 / 2
            
            print("\(self.name) ударил топором в \(enemy.name), нанеся \(self.damage - enemy.defence * 1 / 2) урона")
    }
}

class Assassin: Unit{
    
    override func attack(to enemy: Unit) {
            enemy.health -= self.damage -  self.agility * 3 / 2 + enemy.defence
            
            print("\(self.name) пырнул клинком \(enemy.name), нанеся \(self.damage -  self.agility * 3 / 2 + enemy.defence) урона")
    }
}

class Battlefield{
    
    func beginBattle(with enemies: [Unit]){

        var tempEnemies = enemies
        
        print("==========Битва началась!==========")
        
        guard tempEnemies.count > 0 else {
            return
        }
    
        while tempEnemies.count != 1 || tempEnemies.isEmpty{
            
            for i in 0 ..< (tempEnemies.count - 1) {
                if tempEnemies[i].health <=  0 {
                    tempEnemies.remove(at: i)
                }
                if tempEnemies.count > 2 {
                    tempEnemies[i].attack(to: tempEnemies[i+1])
                    if tempEnemies[i+1].name == tempEnemies.last!.name{
                        tempEnemies[i+1].attack(to: tempEnemies.first!)
                    }
                }
                if tempEnemies[i].health <=  0 {
                    tempEnemies.remove(at: i)
                }
                if tempEnemies.count == 2{
                    tempEnemies.first?.attack(to: tempEnemies.last!)
                    tempEnemies.last?.attack(to: tempEnemies.first!)
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
        for i in 0 ... enemies.count - 1{
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


