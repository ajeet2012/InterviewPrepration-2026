import UIKit

func loadData() {
    
    
    DispatchQueue.global(qos: .utility).async {
        // background work
        let data = fetchDataFromServer()
        
        DispatchQueue.main.async {
            updateUI(data: data)
        }
    }
    
}

func fetchDataFromServer() -> String {
    Thread.sleep(forTimeInterval: 2.0)
    return "Api response"
}

func updateUI(data: String) {
    print("Print data on UI - \(data)")
}

print("api call initiated")
loadData()
print("All steps completed")

/* - Output --
 
 api call initiated
 All steps completed
 Print data on UI - Api response
 
 */


