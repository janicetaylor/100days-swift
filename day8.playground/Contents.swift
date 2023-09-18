import UIKit

// structs

struct Sport {
    var name: String
}

var tennis = Sport(name: "tennis")
tennis.name = "lawn tennis"

// computed properties

struct Sport2 {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if(isOlympicSport) {
            return "is an olympic sport"
        }
        else {
            return "is not an olympic sport"
        }
    }
}

// property observers

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("task is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "loading", amount: 0)
progress.amount = 20
progress.amount = 60
progress.amount = 100

// methods

struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 100
    }
}

let london = City(population: 9)
london.collectTaxes()

// mutating methods

struct Person {
    var name: String
    mutating func makeAnon() {
        name = "Anon"
    }
}

var person = Person(name: "Ed")
person.makeAnon()

// properties and methods of strings

let string = "do or do not"
print(string.count)
print(string.hasPrefix("do"))
print(string.uppercased())
print(string.sorted())

// properties and methods of arrays

var toys = ["Woody"]
print(toys.count)

toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)

