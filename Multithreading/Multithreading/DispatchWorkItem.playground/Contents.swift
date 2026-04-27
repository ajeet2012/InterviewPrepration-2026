import UIKit

/* Dispatch Work Item*/
struct DispatchWorkItemExample {
    
    func runExample() {
        var n: Int = 10
        
        let workItem = DispatchWorkItem {
            n += 1
        }
        
        workItem.notify(queue: .main, execute: {
            print("Work item operation completed successfully - n = \(n)")
        })
        
        let queue = DispatchQueue.global(qos: .default)
        queue.async(execute: workItem)
        
    }
}

let obj = DispatchWorkItemExample()
obj.runExample()
