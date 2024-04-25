import Foundation
import PlaygroundSupport
import _Concurrency

PlaygroundPage.current.needsIndefiniteExecution = true

func calculateFullName(
    firstName: String,
    lastName: String
) async -> String {
    try? await Task.sleep(for: .seconds(1))
    return "\(firstName) \(lastName)"
}

Task {
    let result1 = await calculateFullName(
        firstName: "Foo",
        lastName: "Bar")
    
    
    async let result2 = calculateFullName(
        firstName: "Foo",
        lastName: "Bar")
    
    await result2
}

enum Clothe {
    case socks, shirt , trousers
}

func buySocks() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.socks
}

func buyShirt() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.shirt
}

func buyTrousers() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.trousers
}

struct Ensemble: CustomDebugStringConvertible {
    let clothers: [Clothe]
    let totalPrice: Double
    
    var debugDescription: String{
        "Clother = \(clothers), price= \(totalPrice)"
    }
}

func buyWholeEnsemble() async throws -> Ensemble {
    async let socks = buySocks()
    async let shirt = buyShirt()
    async let trouers = buyTrousers()
    
    let ensemble = Ensemble(clothers: await [
        try socks,
        try shirt,
        try trouers
    ], totalPrice: 200)
    
    return ensemble
}

Task{
    if let ensemble = try? await buyWholeEnsemble(){
        print(ensemble)
    }else{
        "Something went wrong"
    }
}

func getFullName(
    delay: Duration,
    calculator: () async -> String
) async -> String {
    try? await Task.sleep(for: delay)
    return await calculator()
}

func fullName() async -> String{"Foo Bar"}

Task{
    await getFullName(delay: .seconds(1)){
        async let name = fullName()
        return await name
    }
}
