import UIKit

func operationQueue() {
    
    let blockOperations = BlockOperation()
    
    blockOperations.addExecutionBlock {
        Thread.sleep(forTimeInterval: 0.5)
        print("Hello")
    }
    
    blockOperations.addExecutionBlock {
        Thread.sleep(forTimeInterval: 0.5)
        print("Ajeet")
    }
    
    blockOperations.addExecutionBlock {
        Thread.sleep(forTimeInterval: 0.5)
        print("Sharma")
    }
    
    let operationQueue = OperationQueue()
    operationQueue.addOperation {
        print("My operations")
    }
    operationQueue.maxConcurrentOperationCount = 1
    operationQueue.qualityOfService = .utility
    operationQueue.addOperations([blockOperations], waitUntilFinished: true)
    
}

operationQueue()

func operationQueue2() {
    let operationQueue = OperationQueue()
    operationQueue.maxConcurrentOperationCount = 1
    
    operationQueue.addOperation {
        Thread.sleep(forTimeInterval: 3.0)
        print("operation - 1")
    }
    
    operationQueue.addOperation {
        Thread.sleep(forTimeInterval: 2.0)
        print("operation - 2")
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
        operationQueue.cancelAllOperations()
    }
}

operationQueue2()
