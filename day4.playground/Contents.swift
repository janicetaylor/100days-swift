import UIKit

// for loops

let count = 1...10

for number in count {
    print("number is \(number)")
}

for _ in 1...5 {
    print("hello")
}

// while loops

var num = 1

while num <= 10 {
    print(num)
    num = num + 1
}

// repeat loops

var num2 = 1

repeat {
    print(num2)
    num2 = num2 + 1
} while num2 <= 20

// exiting loops

var countdown = 10

while countdown >= 0 {
    print(countdown)
    countdown = countdown - 1
    
    if(countdown == 5) {
        print("let's go")
        break
    }
}

// exiting multiple loops

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("i is: \(i) j is: \(j)")
        
        if product == 50 {
            break outerLoop
        }
    }
}

// skipping items

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    
    print(i)
}

// infinite loops

var counter = 0

while true {
    print("x")
    counter = counter + 1
    
    if counter == 20 {
        break
    }
}
