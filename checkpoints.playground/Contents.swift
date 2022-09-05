import Cocoa

// Checkpoint 1
let tempInCelsius = -40.0
let tempInFahrenheit = 9 * tempInCelsius / 5 + 32
print("Temperature in Celsius is \(tempInCelsius)")
print("Temperature in Fahrenhet is \(tempInFahrenheit)")
print()

// Checkpoint 2
var array = ["Elsa", "Hans"]
array.append("Anna")
array.append("Elsa")
array.append("Kristof")
array.append("Olaf")
print(array.count)
let unique = Set(array)
print(unique.count)
print()

// Checkpoint 3
for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}
print()

// Checkpoint 4
enum RootError: Error {
    case outOfBounds, noRoot
}

func findSquareRoot(of number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw RootError.outOfBounds
    }
    for i in 1...100 {
        if i * i == number {
            return i
        }
    }
    throw RootError.noRoot
}

for _ in 1...10 {
    let x = Int.random(in: -10...110)
    do {
        try print("The square root of \(x) is ", findSquareRoot(of: x))
    } catch RootError.outOfBounds{
        print("Error: number \(x) is out of bounds")
    } catch RootError.noRoot {
        print("Error: \(x) has no root")
    }
}
print()

// Checkpoint 5
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let formattedNumbers = luckyNumbers.filter { !$0.isMultiple(of: 2)}
    .sorted { $0 < $1 }
    .map { "\($0) is a lucky number" }
for number in formattedNumbers {
    print(number)
}
print()
