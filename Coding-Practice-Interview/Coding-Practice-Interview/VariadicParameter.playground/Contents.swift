import UIKit

/* - Variadic parameter
 
 A variadic parameter allows a function to accept zero or more values of the same type.
 
 */

//MARK: -  sumOfNumbers
func sumOfNumbers(_ numbers: Int...) -> Int {
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}

print(sumOfNumbers(1, 2, 3, 4, 5))
print(sumOfNumbers())

//MARK: -  1. Only one variadic parameter per function

//func feature(_ numbers1: Int..., _ numbers2: Int...){
       // ❌ Not allowed
//}


//MARK: -  2. Variadic parameter must be last parameter
//func feature(_ numbers: Int..., _ text: String){
    // ❌ Not allowed
//}

//MARK: - 3 . Can combine with normal parameters

func greet(message: String, names: String...) {
    names.forEach { print("\(message) \($0)") }
}

greet(message: "Good morning", names: "Alice", "Bob", "Charlie")
