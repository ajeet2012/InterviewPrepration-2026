import UIKit


// Designated Initializer

class Person {
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}

// Conveience Initializer

class Employee {
    
    var name: String
    var officeLocation: String
    
    init(name: String, officeLocation: String) {
        self.name = name
        self.officeLocation = officeLocation
    }
    
    convenience init(name: String) {
        self.init(name: name, officeLocation: "Pune")
    }
    
}

let employee1 = Employee(name: "Aman")
let employee2 = Employee(name: "Pavan")
print(employee1.officeLocation)

// required initialiser


class Person2 {
    
    var name: String
    
    required init(_name: String) {
        name = _name
    }
}

class Student: Person2 {
    var studentID: String
    required init(_name: String) {
        self.studentID = "studentID"
        super.init(_name: _name)
    }
}

// Failable initializer (Init?)

class Person4 {
    var name: String?
    var age: Int?
    
    init?(name: String, age: Int) {
        if age <= 20 {
            return nil
        }
        self.name = name
        self.age = age
    }
}

let person4 = Person4(name: "Aman", age: 21)
