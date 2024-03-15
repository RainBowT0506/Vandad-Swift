import Foundation

//func add(
//    _ lhs:Int,
//    _ rhs:Int
//)->Int{
//    lhs + rhs
//}
//


let add:(Int,Int)->Int={
    (lhs:Int,rhs:Int)->Int in lhs + rhs
}

add(20,30)


func customAdd(
    _ lhs:Int,
    _ rhs:Int,
    using function:(Int,Int)->Int
)->Int{
    function(lhs,rhs)
}

customAdd(28, 30, using: {
    (lhs:Int,rhs:Int)->Int in lhs + rhs
})

customAdd(18, 20){
    (lhr,rhs) in lhr + rhs
}

customAdd(8, 10)
{$0 + $1}

let ages = [30,20,19,40]
//ages.sorted(by: {(lhs:Int,rhs:Int)->Bool in
//    lhs < rhs
//})

ages.sorted(by: <)
ages.sorted(by: >)

//
//func < (lhs:Int ,rhs:Int)->Bool{
//
//}


func customAdd2(
    using function:(Int,Int)->Int,
    _ lhs:Int,
    _ rhs:Int
)-> Int{
    function(lhs, rhs)
}

customAdd2(using: {(lhs,rhs) in lhs + rhs}, 20,30)

customAdd2(using: {$0 + $1 + 10 }, 20,30)


func add10To(_ value:Int)->Int{
    value + 10
}

func add20To(_ value:Int)->Int{
    value + 20
}

func doAddittion(
    on value: Int,
    using function:(Int)->Int
)-> Int{
    function(value)
}

doAddittion(on: 20, using: add10To(_:))
doAddittion(on: 30, using: add10To(_:))
