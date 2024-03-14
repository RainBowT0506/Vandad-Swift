import Foundation

let myName = "RainBowT"
let yourName = "RT"

//  Cannot use mutating member on immutable value: 'names' is a 'let' constant
//let names = [myName,yourName]
//names.append("Jackie")
//names.append("Denny")


var names = [myName,yourName]
names.append("Jackie")
names.append("Denny")


let foo = "Foo"
var foo2 = foo
foo2 = "Foo 2"
foo
foo2


let moreNames = [
    "志祺七七",
    "阿滴"
]

var copy = moreNames
copy.append("上班不要看")
moreNames
copy


let oldArray = NSMutableArray(
    array: [
        "志祺七七",
        "阿滴"
    ]
)

oldArray.add("上班不要看")
var newArray = oldArray
newArray.add("老高玩")
oldArray
newArray


let someNames = NSMutableArray(
    array: [
        "志祺七七",
        "阿滴"
    ]
)

//  Cannot assign to value: 'someNames' is a 'let' constant
//someNames = ["館長"]

func changeTheArray(_ array:NSArray){
    let copy = array as! NSMutableArray
    copy.add("木曜四超玩")
}

changeTheArray(someNames)
someNames
