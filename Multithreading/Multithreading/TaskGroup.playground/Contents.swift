import UIKit

/*
 TaskGroup: A Task Group lets you run multiple async tasks concurrently and then collect their results safely.
 
 */

//MARK: - Task Group Basic coding example

func fetchAll() async {
    
    await withTaskGroup(of: Int.self) { group in
        
        group.addTask {
            return 10
        }
        
        group.addTask {
            return 20
        }
        
        group.addTask {
            return 30
        }
        
        for await value in group {
            print(value)
        }
    }
    
}

Task {
    await fetchAll()
}

//MARK: - Task Group Basic coding example

func fetchAllWithReturnValue() async {
    
    let result = await withTaskGroup(of: Int.self) { group in
        
        var outPut: [Int] = []
        group.addTask {
            return 10
        }
        
        group.addTask {
            return 20
        }
        
        group.addTask {
            return 30
        }
        
        for await value in group {
            outPut.append(value)
        }
        return outPut
    }
    print(result)
    
}

Task {
    await fetchAllWithReturnValue()
}

//MARK: - 🔹 Case 1: Using withThrowingTaskGroup


func fetchAllWithException() async throws {
    
    try await withThrowingTaskGroup(of: String.self) { group in
        group.addTask {
            return "A"
        }

        group.addTask {
            //return "B"
            throw NSError(domain: "Fail", code: 1)
        }
        
        group.addTask {
            return "B"
        }
        
        group.addTask {
            return "C"
        }
        
        group.addTask {
            return "D"
        }

        for try await value in group {
            print(value)
        }
    }

}

Task {
    do {
        try await fetchAllWithException()
    }
    catch {
        print(error.localizedDescription)
    }
    
}

/*
 
 ✅ What happens:
     1.    The first thrown error is propagated
     2.    Remaining tasks are automatically cancelled
     3.    The group exits early
 
 */


