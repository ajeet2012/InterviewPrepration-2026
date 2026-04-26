import UIKit

/*
 
 == vs === :
 
 👉 == checks value equality
 👉 === checks reference identity (memory location) / only with reference type
 
 
 */

//MARK: - Struct example

struct Employee: Equatable {
    var id: Int
    var name: String
}
let emp1 = Employee(id: 1, name: "A")
let emp2 = Employee(id: 1, name: "A")
if emp1 == emp2 {
    print("Equal")
}
else {
    print("not equal")
}

//MARK: - Class example

class Person: Equatable {
    var id: Int
    var name: String
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}

var person1 = Person(id: 1, name: "A")
var  person2 = Person(id: 1, name: "A")

// person1 = person2

if person1 == person2 {
    print("persons Equal")
}
else {
    print("persons not equal")
}

if person1 === person2 {
    print("same object")
}
else {
    print("different object")
}


