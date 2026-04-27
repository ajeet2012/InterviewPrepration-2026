import UIKit

//MARK: - Dispatch barrier Example

class Restaurant {
    var menu: [String] = ["Samosa", "Upma", "Pastry"]
    let barrier = DispatchQueue(label: "barrierQueue")
    
    func getAvailableItem(){
        barrier.sync {
            print("Available items - \(menu)")
        }
        
    }
    
    func purchaseItem(item: String){
        barrier.async {
            guard let index = self.menu.firstIndex(of: item) else {
                
                print("Item is not in stock")
                return
                
            }
            self.menu.remove(at: index)
            print("Purchase successfully for this item - \(item)")
        }
        
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

