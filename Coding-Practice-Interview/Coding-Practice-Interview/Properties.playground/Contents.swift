import UIKit

//MARK: - Stored Properties

struct Person {
    var name: String
    var age: Int
}

let person = Person(name: "John", age: 30)
print(person.name)

//MARK: - Computed Properties

struct Rectangle {
    var width: Double
    var height: Double
    
    var area: Double {
        get {
            return width * height
        }
        
        set(newArea){
            height = newArea / width
        }
        
    }
}

var rectangle = Rectangle(width: 100, height: 100)
print("area - \(rectangle.area)")
rectangle.area = 1000
print("height - \(rectangle.height)")

//MARK: - Lazy stored properties

struct Profile {
    lazy var fullName: String = {
        
        return "ajeet sharma"
        
    }()
}

var profile = Profile()
print(profile.fullName)



//MARK: - Type properties

struct Phone {
    static let brand: String = "Apple"
    static func infoPrint(){
        print(brand)
    }
}
print(Phone.brand)
Phone.infoPrint()
class Mobile {
    static let name: String = "Mobile"
    
    class func printInfo() {
        print("brand name - \(name)")
    }
    
    static func printInfoStatic() {
        print("brand name static - \(name)")
    }
}

Mobile.printInfo()
Mobile.printInfoStatic()

class Apple: Mobile {
    
    override class func printInfo() {
        print("iPhone - \(name)")
    }
}

Apple.printInfo()

//MARK: - enum stored properties

enum Planet {
    static let solarSystemName = "Milky way"
    case mercury, venus, earth, mars
}


print(Planet.solarSystemName)

//MARK: - enum computed properties

enum CompassDirection {
    case north, south, west, east
    static var allDirection: [CompassDirection] {
        [.north, .east, .west, .south]
    }
}

print(CompassDirection.allDirection)

//MARK: -  Assciated values in enums
enum MyError: Error {
    case inValidURL
    case noDataFound
    case parsingFailed
}

enum MyResult {
    case success(String)
    case failure(Error)
}

let succcessResult = MyResult.success("success")
let failureResult = MyResult.failure(MyError.inValidURL)

switch failureResult {
case .success(let value):
    print(value)
case .failure(let error):
    print(error)
}

