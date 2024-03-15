import Foundation

struct Person {
    let name: String
    let age: Int
}


let foo = Person(name: "Foo", age: 20)

foo.name
foo.age


struct CommodoreComputer{
    let name: String
    let manufacturer :String
    init(name:String) {
        self.name = name
        self.manufacturer = "Commodore"
    }
}

//let c64 = CommodoreComputer(name: "My Commodore", manufacturer: "Commodore")
//
//let c128 = CommodoreComputer(name: "My commodore 128", manufacturer: "Commodore")

let c64 = CommodoreComputer(name: "C64")
c64.name
c64.manufacturer


struct Person2{
    let firstName: String
    let lastName: String
    var fullName: String{
        "\(firstName) \(lastName)"
    }
}

let jackie = Person2(firstName: "lin", lastName: "jackie")

jackie.firstName
jackie.lastName
jackie.fullName


struct Car{
    var currentSpeed:Int
    mutating func drive(speed:Int){
        "Driving..."
        currentSpeed = speed
    }
}

let immutableCar = Car(currentSpeed: 10)
//  Cannot use mutating member on immutable value: 'immutableCar' is a 'let' constant
//immutableCar.drive(spped: 40)

var mutableCar = Car(currentSpeed: 10)
mutableCar.drive(speed: 30)
mutableCar.currentSpeed

let copy = mutableCar
mutableCar.currentSpeed
mutableCar.drive(speed: 50)
mutableCar.currentSpeed

copy.currentSpeed


struct LiveingThing{
    init(){
        "I'm a living thing"
    }
}


struct Bike{
    let manufacturer:String
    var currendtSpeed:Int
    func copy(currentSpeed:Int)->Bike{
        Bike(
            manufacturer:self.manufacturer,
            currendtSpeed: currentSpeed
        )
    }
}


let bike1 = Bike(manufacturer: "HD", currendtSpeed: 20)

var bike2 = bike1.copy(currentSpeed: 30)
bike1.currendtSpeed
bike2.currendtSpeed

