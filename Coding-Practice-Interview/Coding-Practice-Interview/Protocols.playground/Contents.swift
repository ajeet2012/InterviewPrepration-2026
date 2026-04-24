import UIKit

//MARK: - PROTOCOLS

protocol Vehicle {
    var speed: Int { get }
    func accelerate()
}
class Car: Vehicle {
    var speed: Int = 0
    
    func accelerate() {
        speed += 10
    }
}

var car = Car()
car.accelerate()
car.speed = 10 // ✅ Allowed or ❌ not ???

/*
 
 Quesiton: Why this (car.speed = 10) is working ? protocol Vehicle showing it read-only
 
 Answer. because you’re using the concrete type (Car), not the protocol type (Vehicle).
 The get restriction is enforced only when the variable is typed as the protocol.
 
 */

let vehicle: Vehicle = Car()
//vehicle.speed = 10 // ❌ Compile-time error

/*
 
 Key concept (this is the interview answer)
 
 In Swift, { get } in a protocol makes the property read-only at the protocol interface level, not at the concrete type level.
 If you access the object via the concrete type (Car), you can still mutate it.
 If you access it via the protocol type (Vehicle), mutation is restricted.
 
 */

// How to make it truly read-only everywhere

class Car2: Vehicle {
    
    private(set) var speed: Int = 0
    /*
     
     • Outside world → read-only
     • Inside Car2 → read + write
     
     */
    
    func accelerate() {
        speed += 10
    }
}

let car2 = Car2()
car2.accelerate()


//MARK: - Initializer requirement in Protocols

protocol Initializable {
    var value: Int { get }
    init(value: Int)
}

class Example: Initializable {
    
    var value: Int
    
    required init(value: Int) {
        self.value = value
    }
    
}

//MARK: - Protocol Inheritance

protocol FourWheelerVehicle {
    func start()
}

protocol ElectricCar: FourWheelerVehicle {
    func chargeBattery()
}

class Tesla: ElectricCar {
    func start() {
        
    }
    
    func chargeBattery() {
        
    }
}

//MARK: - Protocol Composition

protocol CanEat {
    func eating()
}
protocol CanDrink{
    func drinking()
}
typealias EatDrink = CanEat & CanDrink

class Person: EatDrink {
    func eating() {
        
    }
    func drinking() {
        
    }
}

//MARK: - Protocol Extensions

protocol Greetable {
    func greet()
}

extension Greetable {
    func greet() {
        print("Hello how are you?")
    }
    
    func greet2() {
        print("Testing")
    }
}

class Email: Greetable {
    
}

let obj: Email = Email()
obj.greet()
obj.greet2()

let obj2: Greetable = Email()
obj2.greet2()

//MARK: - Generic Protocol (Associated type)

protocol Container {
    associatedtype Item
    var items:[Item] { get set }
    mutating func add(_ item: Item)
}

struct Box: Container {
    typealias Item = Int
    var items: [Int] = []
    mutating func add(_ item: Int) {
        items.append(item)
    }
}

var inBox = Box()
inBox.add(1)
inBox.add(2)
inBox.add(3)
print(inBox.items)

