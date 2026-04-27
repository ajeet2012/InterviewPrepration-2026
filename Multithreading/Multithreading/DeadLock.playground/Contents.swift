import UIKit

/*
 
 Deallock:
 
 A deadlock with semaphores in Swift usually happens when a thread waits (wait()) for a signal that never comes — often because the code that should call signal() can’t execute.
 
 
 */

let semaphore = DispatchSemaphore(value: 1)

DispatchQueue.main.async {
    print("Task 1 : Waiting for semaphore")
    semaphore.wait()
    print("Task 1 : Accuire semaphore")
    // Trying to acquire the semahore again without releasing it -> deadlock
    
    print("Task 2 : Waiting again for semaphore")
    semaphore.wait()
    print("This will never print")
    semaphore.signal()
}

RunLoop.main.run()
