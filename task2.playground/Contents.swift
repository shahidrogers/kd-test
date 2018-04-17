//: Playground - noun: a place where people can play

import UIKit

class Pet {
    let name: String
    var owner: Human?
    init(name: String){
        self.name = name
    }
}

class Human {
    var name: String
    var pets: [Pet] = []
    
    func petNames() -> [String] {
        let petNameArray = pets.map({
            (pet: Pet) -> String in pet.name
        })
        
        //print(petNameArray) should print out comma-separated pet name strings
        return petNameArray
    }
    
    init(name: String){
        self.name = name
    }
    
    func adopt(pet: Pet){
        pets.append(pet)
        pet.owner = self
    }
}
