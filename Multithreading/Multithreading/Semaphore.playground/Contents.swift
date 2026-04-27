import UIKit

/*
 
 Dispatch Semaphore - A semaphore is a synchronization tool that can control access to a resource by multiple thread.
 
 */


enum ShoppingSource: String {
    case online
    case inStore
}

nonisolated(unsafe) var shirtsStocks = 15

let semaphore = DispatchSemaphore(value: 1)


struct Pantaloons {
    
    var customerName: String
    var sourceOfShopping: ShoppingSource
    
    func buyShirt(quantitly: Int) {
        
        print("\(customerName) is buying \(quantitly) shirt from \(sourceOfShopping.rawValue.capitalized)")
        
        if quantitly < shirtsStocks {
            
            print("Hii \(customerName) - We have shirt in stocks")
            Thread.sleep(forTimeInterval: Double.random(in: 0...4))
            
            shirtsStocks -= quantitly
            
            
            print("\(sourceOfShopping.rawValue.capitalized) -  Purchase successfully ")
            print("\(sourceOfShopping.rawValue.capitalized) - Shirt stocks right now : \(shirtsStocks)")
            
        }
        else {
            print("Ooppss --- Shirt are out of stock right now.")
        }
    }
}

let concurrentQueue = DispatchQueue(label: "shirtShopping", attributes: .concurrent)

concurrentQueue.async {
    semaphore.wait()
    let shopping = Pantaloons(customerName: "ajeet", sourceOfShopping: .online)
    shopping.buyShirt(quantitly: 10)
    semaphore.signal()
}

concurrentQueue.async {
    semaphore.wait()
    let shopping = Pantaloons(customerName: "rajesh", sourceOfShopping: .inStore)
    shopping.buyShirt(quantitly: 10)
    semaphore.signal()
}


