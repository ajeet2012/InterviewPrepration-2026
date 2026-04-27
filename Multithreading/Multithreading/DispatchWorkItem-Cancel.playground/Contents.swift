import UIKit

struct DispatchWorkItemExample {
    
    func dispatchWorkItemExample() {
        
        var workItem: DispatchWorkItem?
        
        workItem =  DispatchWorkItem {
            
            for i in 1...10 {
                guard let wkItem = workItem, !wkItem.isCancelled else {
                    debugPrint("Work item is cancelled")
                    break
                }
                debugPrint("i - \(i)")
                Thread.sleep(forTimeInterval: 1.0)
            }
        }
        
        workItem?.notify(queue: .main, execute: {
          print("Printing number completed")
        })
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async(execute: workItem!)
        queue.asyncAfter(deadline: .now() + 3.0) {
            workItem?.cancel()
        }
    }
}

let obj = DispatchWorkItemExample()
obj.dispatchWorkItemExample()
