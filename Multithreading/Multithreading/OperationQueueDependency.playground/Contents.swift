import UIKit

class EmployeeRecord {
    func getEmployeRecords() {
        print("\(#function) - start")
        Thread.sleep(forTimeInterval: 3.0)
        print("\(#function) - end")
    }
}

class ComanyRecord {
    func getComanyRecords() {
        print("\(#function) - start")
        Thread.sleep(forTimeInterval: 3.0)
        print("\(#function) - end")
    }
}


func fetchAllRecords() {

    let employBlockOperation = BlockOperation()
    employBlockOperation.addExecutionBlock {
        EmployeeRecord().getEmployeRecords()
    }
    
    let companyBlockOperation = BlockOperation()
    companyBlockOperation.addExecutionBlock {
        ComanyRecord().getComanyRecords()
    }
    
    
    // company block will be executed first --
    
    employBlockOperation.addDependency(companyBlockOperation)
    
    let queue = OperationQueue()
    queue.addOperations([employBlockOperation, companyBlockOperation], waitUntilFinished: false)
    
}

fetchAllRecords()



