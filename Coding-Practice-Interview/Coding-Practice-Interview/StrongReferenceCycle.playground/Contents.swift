import UIKit

/*
 “Strong reference cycles occur when objects strongly reference each other, preventing deallocation; solved using weak or unowned references.”

 */

class Account {
    var accountNumber: Int
    var Person: Person?
    init(accountNumber: Int){
        self.accountNumber = accountNumber
    }
    deinit {
        print("Accont deallocate")
    }
    
}
class Person {
    var name: String
   weak var account: Account?
    init(name: String){
        self.name = name
    }
    deinit {
        print("Person deallocate")
    }
}

var account:Account? =  Account(accountNumber: 1234)
var person:Person? = Person(name: "John")
person?.account = account
account?.Person = person

person = nil
account = nil
