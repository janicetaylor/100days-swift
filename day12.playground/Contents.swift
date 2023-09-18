import UIKit

// protocols

protocol Identifiable0 {
    var id: String { get set }
}

struct User: Identifiable0 {
    var id: String
}

func displayId(thing: Identifiable0) {
    print("id is \(thing.id)")
}

// protocol inheritance
// can inherit from many protocols (unlike classes)

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation {
    
}

// extensions

extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

number.isEven

// protocol extensions

let animals = ["a", "b", "c"]
let beatles = Set(["ringo", "john"])

extension Collection {
    func summarize() {
        print("there are \(count) of us")
    }
}

animals.summarize()
beatles.summarize()

// protocol oriented programming

protocol Identifiable {
    var id: String { get set }
    func identify()
}

extension Identifiable {
    func identify() {
        print("my id is: \(id)")
    }
}

struct User2: Identifiable {
    var id: String
}

let user = User2(id: "smeagol")
user.identify()
