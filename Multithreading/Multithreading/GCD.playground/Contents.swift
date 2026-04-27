import UIKit

/*
 
 Serial Queue: Execute tast one after other.
 
 Concurrent Queue: Unpredictable order of execution. Task B does not have to wait for Task A to complete.
 
 */

//MARK: - Serial queue

//MARK: - Example - 1 : Serial Queue

print("Example - 1 : Serial Queue")

let serialQueue = DispatchQueue.main

serialQueue.async {
     print("Task - 1")
}

serialQueue.async {
    Thread.sleep(forTimeInterval: 1.0)
    print("Task - 2")
}

serialQueue.async {
    print("Task - 3")
}

/*
 
 Result :
 
 Task - 1
 Task - 2 // after 1 seconds
 Task - 3
 
 */


//MARK: - Example - 2 : Custom Serial Queue (label)


let customSerialQueue = DispatchQueue(label: "com.example.customSerialQueue")

customSerialQueue.async {
    Thread.sleep(forTimeInterval: 2.0)
    print("Example - 2 : Custom Serial Queue (label)")
    print("Task - 1")
}

customSerialQueue.async {
    Thread.sleep(forTimeInterval: 1.0)
    print("Task - 2")
}

customSerialQueue.async {
    Thread.sleep(forTimeInterval: 1.0)
    print("Task - 3")
}

customSerialQueue.async {
    Thread.sleep(forTimeInterval: 1.0)
    print("Task - 4")
}

/*
 
 Result :
 
 Task - 1
 Task - 2 // display after 1 second
 Task - 3 // display after 1 second
 Task - 4 // display after 1 second
 
 */

//MARK: - Concurrent queue
//MARK: - Example 3 - Custom concurrent queue (label + attribute)

let concurrentQueue = DispatchQueue(label: "com.test.company", attributes: .concurrent)

concurrentQueue.async {
    
    print("Example 3 -  Custom concurrent queue (label + attribute) ")
    print("Task - 11")
}

concurrentQueue.async {
    print("Task - 22")
}

concurrentQueue.async {
    print("Task - 33")
}
/* In the output all tasks will be execute in random order */

//MARK: - Example 4 - Concurrent queue - DispatchQueue.global(qos: .default)

let globalQueue = DispatchQueue.global(qos: .default)

globalQueue.async {
    print("Example 4 - Concurrent queue - DispatchQueue.global(qos: .default)")
    print("Task - 111")
}

globalQueue.async {
    print("Task - 222")
}

globalQueue.async {
    print("Task - 333")
}

/* In the output all tasks will be execute in random order */
