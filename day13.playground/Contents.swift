import UIKit

// optionals

var age: Int? = nil
age = 12

// unwrapping optionals

var name: String? = nil
if let unwrapped = name {
    print("\(unwrapped.count)")
}

// unwrapping with guard

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("no name")
        return
    }
    
    print("hello \(unwrapped)!")
}

// force unwrapping

let str = "5"
let num = Int(str)!

// implicitly unwrapped optionals

let myage: Int! = nil

// nil coalescing

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"

// optional chaining

let names = ["John", "Paul", "George", "Ringo"]

let beatle = names.first?.uppercased()

// optional try

// failable initializers

// getting back an optional value

// typecasting

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

