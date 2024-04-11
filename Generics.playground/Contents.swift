import Foundation
import CoreGraphics

let x = 10
let y = 20
let z = x + y

func performInt(
    _ op: (Int,Int)->Int,
    on lhs:Int,
    and rhs: Int)->Int{
        op(lhs,rhs)
    }

performInt(+, on: 10, and: 20)
performInt(-, on: 10, and: 20)
performInt(*, on: 10, and: 20)
performInt(/, on: 10, and: 20)


func performDouble(
    _ op: (Double,Double)->Double,
    on lhs:Double,
    and rhs: Double)->Double{
        op(lhs,rhs)
    }

performDouble(+, on: 10, and: 20)
performDouble(-, on: 10, and: 20)
performDouble(*, on: 10, and: 20)
performDouble(/, on: 10, and: 20)


func performWithNumeric<N:Numeric>(
    _ op: (N,N)->N,
    on lhs:N,
    and rhs: N)->N{
        op(lhs,rhs)
    }

//  Int
performWithNumeric(+, on: 10, and: 20)
performWithNumeric(-, on: 10, and: 20)
performWithNumeric(*, on: 10, and: 20)
performWithNumeric(/, on: 10, and: 20)

// Double
performWithNumeric(+, on: 10.1, and: 20.1)
performWithNumeric(-, on: 10.1, and: 20.1)
performWithNumeric(*, on: 10.1, and: 20.1)
performWithNumeric(/, on: 10.1, and: 20.1)


func performWithNumeric2<N>(
    _ op: (N,N)->N,
    on lhs:N,
    and rhs: N)->N where N:Numeric{
        op(lhs,rhs)
    }

performWithNumeric2(+, on: 10, and: 20)
performWithNumeric2(-, on: 10, and: 20)
performWithNumeric2(*, on: 10, and: 20)
performWithNumeric2(/, on: 10, and: 20)


protocol CanJump{
    func jump()
}

protocol CanRun{
    func run()
}

struct Person: CanJump,CanRun{
    func jump() {
        "Jumping..."
    }
    
    func run() {
        "Running..."
    }
}

func jumpAndRun<T: CanJump & CanRun>(_ value:T){
    value.jump()
    value.run()
}

let person = Person()
jumpAndRun(person)

extension [String]{
    func longestString()-> String?{
        self.sorted{(lhs: String , rhs:String)->Bool in
            lhs.count > rhs.count
        }.first
    }
}

[
    "Foo",
    "Bar Baz",
    "Qux"
].longestString()


protocol View{
    func addSubView(_ view:View)
}

extension View{
    func addSubView(_ view:View){
        
    }
}

struct Button:View{
    //empty
}

struct Table:View{
    //empty
}

protocol PresentableAsView{
    associatedtype ViewType: View
    func produceView() -> ViewType
    func configure(
        superView: View,
        thisView: ViewType
    )
    func present(
        view:ViewType,
        on superView: View
    )
}

extension PresentableAsView{
    func configure(
        superView:View,
        thisView:ViewType
    ){
        
    }
    
    func present(
        view: ViewType,
        on superView: View
    ){
        superView.addSubView(view)
    }
    
}

struct MyButton: PresentableAsView{
     
    func produceView() -> Button {
        Button()
    }
    
    func configure(superView: View, thisView: Button) {
    
    }
}

extension PresentableAsView where ViewType == Button{
    func doSomethingWithButton(){
        "This is a Button"
    }
}

let button = MyButton()
button.doSomethingWithButton()


struct MyTable: PresentableAsView{
     
    func produceView() -> Table {
        Table()
    }
}

let table = MyTable()
table.produceView()

extension [Int]{
    func average()-> Double{
        Double(self.reduce(0, +)) / Double(self.count)
    }
}

[1,2,3,4].average()
[4,6].average()
