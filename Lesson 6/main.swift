//
//  main.swift
//  Lesson 6
//
//  Created by Andrei Naumenko on 04.08.2021.
//

import Foundation

//Все скопировал с другова проекта, буду разбираться, можно на проверку не тратить время...

enum Pet: String {
    case dog = "Собака"
    case cat = "Кошка"
}

class Card {
    let pet: Pet
    let name: String
    let age: Int
    
    init (pet: Pet, name: String, age: Int ) {
        self.pet = pet
        self.name = name
        self.age = age
    }
}

extension Card {
    var priText: String {"\(pet.rawValue) | \(name) | \(age)"}
}


struct Ochered<T> {
    
    private var items:[T] = []

    func filter(predicate: (T) -> Bool)-> [T] {
        var newArray: [T] = []
        for item in items {
            if predicate(item) {
                newArray.append(item)
            }
        }
     return newArray
    }
    mutating func dobavit (_ item: T) {
        items.append(item)
    }

    mutating func udalit () ->T? {
        guard items.count > 0  else {return nil}
        return items.removeFirst()
    }

}

var cards = Ochered<Card>()

cards.dobavit(Card(pet: .dog, name: "Бобик", age: 5))
cards.dobavit(Card(pet: .dog, name: "Шарик", age: 7))
cards.dobavit(Card(pet: .cat, name: "Барсик", age: 11))
cards.dobavit(Card(pet: .dog, name: "Тузик", age: 4))
cards.dobavit(Card(pet: .cat, name: "Тазик", age: 6))
   

var filterCards = cards.filter {item in item.age > 6 }
filterCards.forEach {print($0.priText)}
 
