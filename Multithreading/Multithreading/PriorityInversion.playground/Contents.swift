import UIKit

/*
 
 Priority Inversion - Priority Inversion is a concurrency problem that happens in multithreaded or real-time systems when a high-priority task is waiting for a low priority task to release a resource.
 
 
 */

let hightProprity = DispatchQueue.global(qos: .userInitiated)
let mediumProprity = DispatchQueue.global(qos: .utility)
let lowProprity = DispatchQueue.global(qos: .default)

let semaphore = DispatchSemaphore(value: 1)

func printMessage(queue: DispatchQueue, message: String) {
    queue.async {
        semaphore.wait()
        for i in 1...10 {
            print(message)
        }
        semaphore.signal()
    }
}

printMessage(queue: mediumProprity, message: "👁️")
printMessage(queue: lowProprity, message: "✌🏻")
printMessage(queue: hightProprity, message: "♥️")

