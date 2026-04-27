import UIKit


/*
 
 A global actor in Swift ensures that specific code always executes on a single, shared concurrency context, providing thread safety across the entire app.
 
 - A globalActor declared once and used accross the entire app.
 - Gurantees that all code marked with it runs on the same thread/executor.
 - Prevents data race by ensuring exlusive access to data isolated to that actor.
 
 --------------------------------------------------
 Concept             -   Meaning
 --------------------------------------------------
 
 Actor               -   Instance-level isolation
 
 Global Actor        -   App-wide shared isolation
 
 @MainActor          -   Runs code on main thread
 
 
 */

@globalActor
actor DatabaseActor {
    static let shared = DatabaseActor()
}


@DatabaseActor
class DatabaseManager {
    
    func saveData() {
        print("Saving safely")
    }
    
}
