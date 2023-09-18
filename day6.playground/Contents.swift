import UIKit

// day 6 closures

let driving = {
    print("driving...")
}

driving()

let driving2 = { (place: String) in
    print("driving to \(place)")
}

driving2("London")


let driving3 = { (place: String) -> String in
    return "driving to \(place)"
}

let message = driving3("NYC")


func travel(action: () -> Void) {
    action()
    print("getting ready")
}

travel(action: driving)

func travelAgain(action: () -> Void) {
    print("hello")
    action()
}

travelAgain {
    print("traveling again")
}
