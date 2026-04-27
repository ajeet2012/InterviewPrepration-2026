import UIKit

/*
 
 actor: An actor is a reference type which is used for providing thread safty. It ensures data-race safety by allowing only one tasK at a time to access its mutable properties.
 
 */

//MARK: - actor Example


actor Restaurant {
    
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
    Task {
        await restaurant.purchaseItem(item: "Upma")
    }
    
}
queue.async {
    Task {
        await restaurant.getAvailableItem()
    }
    
}


