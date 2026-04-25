import UIKit
import Foundation
/*
 
 Opaque type (some) means “I am returning a specific concrete type, but I am hiding what that type is.”
 
 */

protocol Shape {
    func area() -> Double
}

struct Circle: Shape {
    var radius: Double
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
}

func makeCircle() -> any Shape {
    return Circle(radius: 10)
}

let shape = makeCircle()
print(shape.area())

// some used on associated type

protocol Vehicle {
    associatedtype Unit
    func speed() -> Unit
}

struct Car: Vehicle {
    func speed() -> Int {
        return 120
    }
}

struct Bike: Vehicle {
    func speed() -> Double {
        return 120.4
    }
}

// Opaque type
func getVehicle() -> some Vehicle {
    return Bike()
}

let v = getVehicle()
print(v.speed()) // 120
