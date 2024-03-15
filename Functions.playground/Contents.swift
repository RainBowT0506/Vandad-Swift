import Foundation

func noArgAnNoReturnValue(){
    "I don's know what I'm doing"
}

noArgAnNoReturnValue()

func plusTwo(value:Int){
    let newValue = value + 2
}

plusTwo(value: 28)

func newPlusTwo(value:Int)->Int{
    value + 2
}

newPlusTwo(value: 30)


func customAdd(value1:Int,value2:Int)->Int{
    value1 + value2
}


let customAdded = customAdd(value1: 10, value2: 28)


func customMinus(
_ lhs:Int,
_ rhs:Int
)->Int{
    lhs - rhs
}

let customSubtracted = customMinus(20, 10)

func doSomethingComplicated(with value:Int)->Int{
    func mainLogic(value:Int)->Int{
        value + 2
    }
    return mainLogic(value: 28 + 3)
}

doSomethingComplicated(with: 28)


func getFullName(
    firstName:String = "上班",
    lastName:String = "不要看"
)->String{
    "\(firstName) \(lastName)"
}

getFullName()
getFullName(firstName: "下班")
getFullName(lastName: "要看")
getFullName(firstName: "下班",lastName: "要看")
