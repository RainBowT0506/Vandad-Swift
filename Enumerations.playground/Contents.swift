import Foundation



//struct Animal {
//    let type:String
//    init(type:String){
//        if type == "Rabbit" || type == "Dog" || type == "Cat"{
//            self.type = type
//        }else{
//            preconditionFailure()
//        }
//    }
//}
//
//Animal(type: "Bike")


enum Animals{
    case cat
    case dog
    case rabbit
    case hedgeHog
}

let cat = Animals.cat
cat

if cat == Animals.cat{
    "This is a cat"
}else if cat == Animals.dog{
    "This is a dog"
}else {
    "This is something else"
}


func describeAnimal(_ animal:Animals){
    switch animal{
    case .cat:
        "This is a cat"
        break
    case .dog:
        "This is a dog"
        break
    case .rabbit:
        "This is a rabbit"
        break
    case .hedgeHog:
        "This is a hedgehog"
        break
    default:
        "This is something else"
    }
}

describeAnimal(Animals.rabbit)


enum Shortcut {
    case fileOrFolder(path:URL,name:String)
    case wwwUrl(path:URL)
    case song(artist:String,songName:String)
}

let wwwApple = Shortcut.wwwUrl(
    path: URL(string:"https://apple.com")!
)

switch wwwApple{
case .fileOrFolder(path: let path, name: let name):
    path
    name
    break
case .wwwUrl(path: let path):
    path
    break
case .song(artist: let artist, songName: let songName):
    artist
    songName
    break
}

switch wwwApple{
case .fileOrFolder( let path, let name):
    path
    name
    break
case .wwwUrl(let path):
    path
    break
case .song(  let artist,  let songName):
    artist
    songName
    break
}


switch wwwApple{
case let .fileOrFolder( path, name):
    path
    name
    break
case let .wwwUrl(path):
    path
    break
case let .song(artist, songName):
    artist
    songName
    break
}


if case let .wwwUrl(path) = wwwApple{
    path
}

let withoutYou = Shortcut.song(artist: "Symphony", songName: "Without You")

if case let .song(_,songName) = withoutYou{
    songName
}

enum Vehicle{
    case car(manufacturer:String , model:String)
    case bike(manufacturer:String,yearMade:Int)
    
    func getManufacturer1()->String{
        switch self {
        case let .car(manufacturer, _):
            return manufacturer
        case let .bike(manufacturer, _):
            return manufacturer
        }
    }
    
    var getManufacturer:String{
        switch self {
        case let .car(manufacturer, _):
            return manufacturer
        case let .bike(manufacturer, _):
            return manufacturer
        }
    }
}

let car = Vehicle.car(manufacturer: "Tesla", model: "X")
let bike = Vehicle.bike(manufacturer: "HD", yearMade: 1987)
 
car.getManufacturer
bike.getManufacturer


enum FamilyMember :String{
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
}

FamilyMember.father.rawValue
FamilyMember.brother.rawValue


enum FavoriteEmoji: String ,CaseIterable{
    case blush = "😊"
    case rocket = "🌂"
    case fire = "😡"
}

FavoriteEmoji.allCases
FavoriteEmoji.allCases.map(\.rawValue)

if let blush = FavoriteEmoji(rawValue: "😊"){
    "Found the blush emoji"
    blush
}else{
    "This emoji doesn't exist"
}

if let snow = FavoriteEmoji(rawValue: "❅"){
    "Snow exists?! Really?"
    snow
}else{
    "As Expected, snow doesn't exist in our enum"
}

enum Height{
    case short, medium, long
    mutating func makeLong(){
        self = Height.long
    }
}

var myHeight = Height.medium
myHeight.makeLong()
myHeight

indirect enum IntOperation{
    case add(Int,Int)
    case subtract(Int,Int)
    case freeHand(IntOperation)
    
    func calculateResult(
        of operation: IntOperation? = nil
    ) -> Int{
        switch operation ?? self{
            
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .subtract(lhs, rhs):
            return lhs - rhs
        case let .freeHand(operation):
            return calculateResult(of: operation)
        }
    }
}

let freeHand = IntOperation.freeHand(.add(2, 4))
freeHand.calculateResult()
