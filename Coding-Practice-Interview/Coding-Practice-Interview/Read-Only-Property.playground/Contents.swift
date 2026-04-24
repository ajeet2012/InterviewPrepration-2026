import UIKit

//MARK: - Read only propterty

class Bike {
    
    // Stored - Read-Only properties
    
    private(set) var speed: Int = 0
    
    
    // Computed - Read-Only properties
    
    var _speed: Int {
        get {
            return speed
        }
        set {
            
        }
    }
    
    func accelerate() {
        speed += 10
    }
}

let bike = Bike()
bike.accelerate()
print(bike.speed)
bike._speed = 20
