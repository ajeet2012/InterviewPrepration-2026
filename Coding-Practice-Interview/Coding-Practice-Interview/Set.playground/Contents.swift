import UIKit

/*
 
 - Set is unordered collection
 - Duplicate value not allowed
 - Index is not allowed
 
 */

let valuesSet: Set = [1,1,2, 2, 3, 5, 3,5]
print(valuesSet)

// Access set element

// 1 -
print("---- 1 ----")
for value in valuesSet {
    
    print(value)
}

// 2 -

print("---- 2 ----")
valuesSet.forEach { element in
    
    print(element)
}

// 3 -
print("----- 3 -----")
if let value = valuesSet.first(where: { $0 == 20} ){
    print(value)
}

