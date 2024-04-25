import Foundation

let firstName: String? = "Foo"
let lastName: String? = " Bar"
let fullName = firstName + lastName

func + (
    lhs: String?,
    rhs:String?
)-> String? {
    switch(lhs,rhs){
    case (.none, .none):
        return nil
    case let (.some(value), .none),
        let (.none, .some(value)):
        return value
    case let (.some(lhs),.some(rhs)):
        return lhs + rhs
    }
}

//  unary prefix
prefix operator ^
prefix func ^ (value: String)-> String {
    value.uppercased()
}

let lowercaseName = "Foo Bar"
let uppercaseName = ^lowercaseName

postfix operator *
postfix func * (value:String)-> String{
    "*** \(value) ***"
}

let withStars = lowercaseName*


struct Person{
    let name: String
}

struct Family{
    let members: [Person]
}

func + (
    lhs: Person,
    rhs: Person
)-> Family {
    Family(members: [lhs,rhs])
}

func + (
    lhs: Family,
    rhs: Person
) -> Family {
    var members = family.members
    members.append(rhs)
    
    return Family(members: members)
}

func + (
    lhs: Family,
    rhs: [Person]
) -> Family {
    var members = family.members
    members.append(contentsOf: rhs)
    
    return Family(members: members)
}

let mom = Person(name: "Mom")
let dad = Person(name: "Dad")
let son = Person(name: "Son")
let daughter1 = Person(name: "daughter1")
let daughter2 = Person(name: "daughter2")


let family = mom + dad
family.members.count

let familyWithSon = family + son
familyWithSon.members.count

let familyWithDaugters = familyWithSon + [
    daughter1,
    daughter2
]
familyWithDaugters.members.count
