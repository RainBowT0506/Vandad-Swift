import Foundation


struct Person{
    let firstName: String?
    let lastName: String?
    
    enum Errors: Error{
        case firstNameIsNil
        case lastNameIsNil
        case bothNamesAreNil
    }
    
    func getFullName() throws -> String{
        //        if let firstName, let lastName{
        //            "\(firstName)\(lastName)"
        //        }else if firstName == nil , lastName != nil{
        //            throw Errors.firstNmaeIsNil
        //        }
        
        switch(firstName,lastName){
        case(.none,.none):
            throw Errors.bothNamesAreNil
        case(.none,.some):
            throw Errors.firstNameIsNil
        case(.some,.none):
            throw Errors.lastNameIsNil
        case let(.some(firstName),.some(lastName)):
            return "\(firstName) \(lastName)"
        }
    }
}

let foo = Person(firstName: "Foo", lastName: nil)


do{
    let fullName = try foo.getFullName()
}catch{
    "Got an error = \(error)"
}


let bar = Person(firstName: nil, lastName: nil)


do{
    let fullName = try bar.getFullName()
    fullName
} catch Person.Errors.firstNameIsNil{
    "First name is nil"
} catch Person.Errors.lastNameIsNil{
    "Last name is nil"
} catch Person.Errors.bothNamesAreNil{
    "Both names are nil"
} catch {
    "Some other error was thrown"
}




struct Car{
    let manufacturer: String
    
    enum Errors: Error{
        case invalidManufacturer
    }
    
    init(
        manufacturer:String
    ) throws{
        if manufacturer.isEmpty{
            throw Errors.invalidManufacturer
        }
        self.manufacturer = manufacturer
    }
}

do{
    let myCar = try Car(manufacturer: "")
    myCar
    myCar.manufacturer
} catch Car.Errors.invalidManufacturer{
    "Invalid manufacturer"
} catch {
    "Some other error"
}

if let yourCar = try? Car(manufacturer: "Tesla"){
    "Success, your car = \(yourCar)"
}else{
    "Failed to construct and erro is not accessible now"
}


let theirCar = try! Car(manufacturer: "Ford")
theirCar.manufacturer


struct Dog{
    let isInjured: Bool
    let isSleeping: Bool
    
    enum BarkingErrors: Error{
        case cannotBarkIsSleeping
    }
    
    enum RunningErrors: Error{
        case cannotRunIsInjured
    }
    
    func bark() throws{
        if isSleeping {
            throw BarkingErrors.cannotBarkIsSleeping
        }
        "Bark..."
    }
    
    func run() throws{
        if isInjured {
            throw RunningErrors.cannotRunIsInjured
        }
        "Run..."
    }
    
    func barkAndRun() throws{
        try bark()
        try run()
    }
}

let dog = Dog(isInjured: true, isSleeping: true)
do{
    try dog.barkAndRun()
}catch Dog.BarkingErrors.cannotBarkIsSleeping,
       Dog.RunningErrors.cannotRunIsInjured{
    "Cannont-bark-is-sleeping OR cannot-run-is-injured"
}catch{
    "Some Other error"
}

let dog2 = Dog(isInjured: false, isSleeping: false)

do{
    try dog2.barkAndRun()
}catch Dog.BarkingErrors.cannotBarkIsSleeping,
       Dog.RunningErrors.cannotRunIsInjured{
    "Cannont-bark-is-sleeping OR cannot-run-is-injured"
}catch{
    "Some Other error"
}


let dog1 = Dog(isInjured: true, isSleeping: true)


do{
    try dog1.barkAndRun()
}catch Dog.BarkingErrors.cannotBarkIsSleeping{
    "Cannont-bark-is-sleeping"
} catch Dog.RunningErrors.cannotRunIsInjured{
    "cannot-run-is-injured"
}catch{
    "Some Other error"
}


func fullName(
    firstName: String?,
    lastName: String?,
    calculator: (String?, String?) throws -> String?
) throws -> String?{
    try calculator(firstName, lastName)
}

enum NameErrors: Error{
    case firstNameIsInvalid
    case lastNameIsInvalid
}

func +(
    firstName: String?,
    lastName: String?
) throws -> String?{
    guard let firstName,!firstName.isEmpty else{
        throw NameErrors.firstNameIsInvalid
    }
    
    guard let lastName, !lastName.isEmpty else{
        throw NameErrors.lastNameIsInvalid
    }

    return "\(firstName) \(lastName)"
}

do{
    let fooBar = try fullName(firstName: "Foo", lastName: "Bar", calculator: +)
}catch NameErrors.firstNameIsInvalid{
    "First name is invalid"
}catch NameErrors.lastNameIsInvalid{
    "Last name is invalid"
} catch let err{
    "Some other error= \(err)"
}

enum IntegerErrors: Error{
    case noPositiveIntegerBefore(thisValue: Int)
}

func getPreviousPositiveInteger(
    from int: Int
) -> Result<Int, IntegerErrors>{
    guard int > 0 else{
        return Result.failure(
            IntegerErrors.noPositiveIntegerBefore(thisValue: int)
        )
    }
    return Result.success(int - 1)
}


func performGet(forValue value: Int){
    switch getPreviousPositiveInteger(from: value){
    case let .success(previousValue):
        "Previous value is \(previousValue)"
    case let .failure(error):
        switch error{
        case let .noPositiveIntegerBefore(thisValue: value):
            "No Positive integer berfore \(value)"
        }
    }
}

performGet(forValue: 0)
performGet(forValue: 2)
