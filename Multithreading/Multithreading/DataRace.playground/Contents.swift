import UIKit

/*
 
 Data race: Data race is swift happens when two or more thread access the same mutable at the same time, at least one thread is writting and there is no synchronization (no locks, no actors, no proper isolation)
 
 */

//MARK: - Data Race Example

/* DATA RACE EXAMPLE */

class Restaurant {
    var menu: [String] = ["Samosa", "Upma", "Pastry"]
    
    func getAvailableItem(){
        Thread.sleep(forTimeInterval: 0.0001)
        print("Available items - \(menu)")
    }
    
    func purchaseItem(item: String){
        Thread.sleep(forTimeInterval: 0.0001)
        guard let index = menu.firstIndex(of: item) else {
            
            print("Item is not in stock")
            return
            
        }
        menu.remove(at: index)
        print("Purchase successfully for this item - \(item)")
    }
}

nonisolated(unsafe) var restaurant = Restaurant()

let queue = DispatchQueue(label:"dataRace", attributes: .concurrent)

queue.async {
    restaurant.purchaseItem(item: "Upma")
}
queue.async {
    restaurant.getAvailableItem()
}
queue.async {
    restaurant.getAvailableItem()
}
