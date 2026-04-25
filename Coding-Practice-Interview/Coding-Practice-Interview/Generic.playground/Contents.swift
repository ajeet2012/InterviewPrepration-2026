import UIKit

/*
 
 Generic - Generic allow to write functions, types (struct, class, enums) and protocol that
 can work with any type, subject to constraints to define.
 
 */

/*
 
 The Numeric after T: is called a type constraint.
 
 */
func addition<T: Numeric>(a: T, b: T) -> T{
    
    return a + b
}

print(addition(a: 23, b: 24))
print(addition(a: 23.2, b: 24.5))

// MARK: - Generic Structure

struct Stack<Element> {
    
    private var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        return items.popLast()
    }
    
    func printInfo() {
        print("Stack - \(items)")
    }
    
}

var intStack = Stack<Int>()
intStack.push(155)
intStack.push(234)
intStack.push(376)
intStack.printInfo()


//MARK: -  Generic Class

class Repository<Model>{
    private var items:[Model] = []
    func add(_ item: Model){
        items.append(item)
    }
    func allItems() -> [Model] {
        return items
    }
}

let userRepo = Repository<String>()
userRepo.add("Arthur")
userRepo.add("Barbara")
print(userRepo.allItems())

// Generic enum

enum Result<Value, ErrorType: Error> {
    case success(Value)
    case failure(ErrorType)
}

enum NetworkError: Error {
    case noInternetConnection
    case noDataFound
    case parsingError
}

let successResult = Result<String, NetworkError>.success("Success")
let failureResult = Result<String, NetworkError>.failure(.noInternetConnection)

switch successResult {
case .success(let value):
    print("Success: \(value)")
case .failure(let error):
    print("Error: \(error)")
}

// Generic protocol - associated type

protocol StackProtocol {
    associatedtype ItemType
    var stack:[ItemType] { get set }
    mutating func push(_ item: ItemType)
    func pop() -> ItemType?
}

struct StackInt: StackProtocol {
    var stack: [Int]
    
    mutating func push(_ item: Int){
        
    }
    func pop() -> Int? {
        return nil
    }
}
