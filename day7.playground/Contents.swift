import UIKit

// day 7 closures

func travel(action: (String) -> Void ) {
    print("lets go")
}

travel { (place: String) in
    print("going to \(place) in my car")
}

func travel2(action :(String) -> String) {
    print("hello")
}

travel2 { (place: String) -> String in
    return "going home to \(place)"
}
