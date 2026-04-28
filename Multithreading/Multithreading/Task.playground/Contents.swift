import UIKit

/*
 
 Task : A Task represents a unit of asynchronous work.
 
 👉 “Start this work now, and let it run concurrently without blocking the current thread.”

 It’s part of Swift Concurrency (introduced in Swift 5.5) along with async/await.
 
 “Start this work asynchronously, allowing it to run concurrently without blocking the current execution flow.”
 
 */

//MARK: - Task Example ------------

func viewDidLoad() {
    print("ViewDidLoad Start")
    
    Task {
        let result = await apiCall()
        print(result)
    }
    
    
    print("ViewDidLoad End")
}

func apiCall() async -> String{
    do {
        try await Task.sleep(nanoseconds: 2_000_000_000)
        return "Testing result"
    }
    catch {
        print(error)
    }
    return "-"
}


viewDidLoad()


/*
 
 
 - Task inherits context (actor, priority, cancellation),
 
 - Task.detached runs completely independent with no inheritance.

 
 */


//MARK: - Task Priority ------------

// priority can be .high, .medium, .low, .background, .utility, .userInitiated.

Task(priority: .high) {
    print("High priority task")
}

Task(priority: .low) {
    print("Low priority task")
    
}

//MARK: -  Cancellation Behavior

let task = Task {
    print("Task is cancellable task - 1")
    try await Task.sleep(for: .seconds(1))
    print("Task is cancellable task - 2")
}

task.cancel()
