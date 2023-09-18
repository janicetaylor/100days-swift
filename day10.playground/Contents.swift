import UIKit

// creating your own classes

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise() {
        print("woof")
    }
}

// inheritance

class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
    
    override func makeNoise() {
        print("poodle woof")
    }
}

// overriding -- inherit from parents, change behavior

// final -- can't inherit from class

// copying objects

class Singer {
    var name = "taylor swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = Singer()
singerCopy.name = "beyonce"
print(singer.name)

// deinitializers

class Person {
    var name = "john Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("i'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

// mutability

class Singer2 {
    let name = "taylor"
}

let taylor = Singer2()

// difference between classes and structs:

// classes inherit from another
// class can be final, so can't inherit from it
// method overriding -- child writes over parent method
// two variables in classes both point to the same place in memory
// classes have a deinitializer (deinit)
// classes, constants can be chnaged unless it's using let

