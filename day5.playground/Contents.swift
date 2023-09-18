import UIKit

// day 5

// writing functions

func printHelp() {
    let message = "test"
    print(message)
}

printHelp()

// accepting parameters

func printHelp2(title: String) {
    print(title)
}

// returning values

func printHelp3() -> String {
    return "hello"
}

func printHelp4(to name: String) {
    print(name)
}

// externally called to
// interally called name

printHelp4(to: "hello")

// omitting parameter labels

func greet(_ person: String) {
    print(person)
}

greet("Janice")

// default parameters

func greet(_ person: String, nicely: Bool = true) {
    if nicely == true  {
        print("greet nicely \(person)")
    }
    else {
        print("greet \(person)")
    }
}

greet("taylor")
greet("taylor", nicely: true)

// variadic functions

print("haters", "gonna", "hate")

func square(numbers: Int...) {
    for number in numbers {
        print("number squared is: \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4)

// running throwing functions

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
      //  throw Error
    }
    
    return true
}

do {
    try checkPassword("password")
} catch {
    print("can't use password")
}

// inout

func doubleInPlace(number: inout Int) {
    number *= 2
}

var num = 10
doubleInPlace(number: &num)




