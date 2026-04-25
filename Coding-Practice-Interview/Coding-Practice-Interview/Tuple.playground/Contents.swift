import UIKit

/*
 
 Tuple: A tuple is lightweight way to group multiple values into single compund value.
 
 You can mix different types unlike arrays.
 
 */


var person = ("Rahul", 30, 170)
print(person.0)
person.0 = "ajeet"

var person2 = (name:"ajeet", age: 38, height: 170)
print(person2.name)

func getUserDetails() -> (name: String, age: Int, height: Double)
{
    return ("rahul", 30, 170.0)
}

print(getUserDetails())
