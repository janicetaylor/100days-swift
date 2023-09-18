import UIKit

// initializers

struct User {
    var username: String
    init() {
        username = "Anon"
        print("creating new user")
    }
}

var user = User()
user.username = "me"

// referring to the current instance

struct Person {
    var name: String
    
    init(name: String) {
        print("\(name) was born")
        self.name = name
    }
}

// lazy properties

struct FamilyTree {
    init() {
        print("creating tree")
    }
}

struct Person2 {
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var person = Person2(name: "Me")
person.familyTree

// static properties

struct Student {
    var name: String
    static var classSize = 0
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let ed = Student(name: "ed")
let taylor = Student(name: "taylor")
print(Student.classSize)

// access control

struct Person3 {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "my id is: \(id)"
    }
}

let ed2 = Person3(id: "12345")
