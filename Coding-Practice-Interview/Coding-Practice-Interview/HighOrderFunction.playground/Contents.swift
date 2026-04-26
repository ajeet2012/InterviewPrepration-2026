import UIKit

/*
 
 High order functions
 
 1. map
 2. compact map
 3. flat map
 4. filter
 5. reduce
 6. forEach
 7. sorted and sort
 8. contains(where:)
 9. first(where:)
 10. allSatisfy
 
 */

//MARK: - 1. map - Transforms each element of a collection into a new value, keeping the same count.

var mapArray: [Int] = [1, 2, 3, 4, 5]
var newMapArray1: [Int] = mapArray.map { $0 * 2 }
var newMapArray2: [Int] = mapArray.map { value in
    return value + 2
}

// Dictionary -

var info = [String: String]()
info["name"] = "John"
info["age"] = "30"
info["city"] = "New York"
info["hobby"] = "coding"

let keys = info.map { $0.key }
let value = info.map { $0.value }

let appDictionary: [String: Int] = ["john" : 25, "ramesh": 30, "amit" : 34]
let incrementAges = appDictionary.mapValues({ $0 + 1})



//MARK: -  2. compactMap - Transforms elements and removes all nil results.
var compacMapArray = ["a", nil, "2", nil, "d"]
var newCompaMapArray: [String] = compacMapArray.compactMap{ $0 }

let arr = ["1", "2", "abc", "3"]
let result = arr.compactMap { Int($0) }

//MARK: -  3. flatMap - Transforms and flattens nested collections into a single-level collection.

let flatMapArray = [[1, 2], [3, 4], [5, 6]]
let newFlatMapArray: [Int] = flatMapArray.flatMap({$0})

//MARK: -  4. filter - Returns elements that satisfy a given condition.
let filterArray = [1, 2, 3, 4, 5, 6, 7, 8, 10]
let newFilterArray:[Int] = filterArray.filter({ $0 > 2})
let newFilterArray2:[Int] = filterArray.filter { value in
    return value > 3
}
let multiply2:[Int] = filterArray.filter { $0.isMultiple(of: 2)}

//MARK: - 5. reduce - Combines all elements into a single value using an accumulator.
let reduceArray: [Int] = [1, 2, 3, 4, 5]
let addition: Int = reduceArray.reduce(0, +)
let addition2: Int = reduceArray.reduce(0, { $0 + $1})
let addition3: Int = reduceArray.reduce(0, {
   return $0 + $1
}
)

//MARK: - 6. forEach - Executes a closure on each element without returning a new collection
reduceArray.forEach { element in
    print(element)
}

//MARK: - 7. sorted/sort
var sampleArray: [Int] = [24, 3, 2, 122, 20, 8, 18]
sampleArray.sorted { a, b in
    a > b
}

print(sampleArray)

sampleArray.sort(by: <)
print(sampleArray)

//MARK: - 8 contains(where:)
let containWhere = sampleArray.contains { element in
    element.isMultiple(of: 2)
}

//MARK: - 9 first(where:)
let fistWhere = sampleArray.first { element in
    element.isMultiple(of: 2)
}
print(fistWhere)


