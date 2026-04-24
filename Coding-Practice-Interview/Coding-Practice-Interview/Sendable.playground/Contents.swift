import UIKit

//MARK: - Sendable
/*
 
 Sendable is a marker protocol in Swift Concurrency that ensures a type is safe to transfer across concurrency domains (threads, tasks, actors) without data races.
 
 */

struct Point: Sendable {
    let x: Int
    let y: Int
}

/* This is safe because
 
 - It's a value type (struct)
 - Its properties are immutable (let)
 - All stored propertis are Sedable types
 */
 
//MARK: - Making class sendable --

final class SafeCounter: Sendable {
    
}

class User {
    var name: String
    init(name: String) {
        self.name = name
    }
}

func process(user: User) async {
    // ⚠️ Compiler warning: User is not Sendable
    // This object is not safe to move across concurrency boundaries
}

/*
 
 Actors ensure thread-safe access to their internal state, but they don’t guarantee that the data being passed in or out is safe. Sendable ensures that data crossing concurrency boundaries doesn’t introduce race conditions, so both are needed together.
 
 */


/*
 
 💡 One-line analogy

 Actor = safe house 🏠
 Sendable = safe luggage 🎒

 Even if the house is secure, you shouldn’t bring dangerous items inside.

 
 🚀 Senior-level insight (impressive)
     •    Actors + Sendable = complete concurrency safety model
     •    Swift enforces Sendable at compile time
     •    Actors enforce isolation at runtime
 
 */


final class Safe: @unchecked Sendable {
    var name: String = ""
}

class NotSafe {
    
}

enum Test: Sendable {
    case value(Safe)
  //  case value2(NotSafe) // ❌ Not Sendable
}
/*
 
 🚀 Senior-level insight (very impressive)
     •    Sendable is a marker protocol
     •    Enforced at compile time
     •    Works with Swift Concurrency (actors, async/await)
     •    Classes require explicit guarantees

 */
