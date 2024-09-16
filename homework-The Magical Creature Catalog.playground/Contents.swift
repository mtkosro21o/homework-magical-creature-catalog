import Foundation

struct Creature {
    let name: String
    let description: String
    let isGood: Bool
    let magicPower: Int

    var ability: String {
        "Magic ability \(fibonacciAbility(n: magicPower))"
    }

    func interactWith(_ other: Creature) {
        switch (self.isGood, other.isGood) {
        case (true, true):
            print("\(self.name) and \(other.name) are both good. No actions")
        case (false, false):
            print("\(self.name) and \(other.name) are both evil. No actions")
        default:
            print("\(self.name) and \(other.name) are good vs evil. \(self.name) has \(self.ability) and \(other.name) has \(other.ability)")

            if self.magicPower == other.magicPower {
                print("It's tie!")
            } else if self.magicPower > other.magicPower {
                print("\(self.name) won!")
            } else {
                print("\(other.name) won!")
            }
        }
    }
}

func fibonacciAbility(n: Int) -> Int {
    var fibonacciSeries: [Int] = []

    for index in 0...n {
        if index < 2 {
            fibonacciSeries.append(index)
        } else {
            let element1 = fibonacciSeries[fibonacciSeries.count - 1]
            let element2 = fibonacciSeries[fibonacciSeries.count - 2]
            fibonacciSeries.append(element1 + element2)
        }
    }

    return fibonacciSeries[n]
}

let creatureCatalog = [
    Creature(name: "Unicorn", description: "Attack with the horn", isGood: true, magicPower: 8),
    Creature(name: "Dragon", description: "Can use fire breathing", isGood: false, magicPower: 10),
    Creature(name: "Phoenix", description: "Attack with the wings", isGood: true, magicPower: 9)
]

func describeCreatureInteractions(creatures: [Creature]) {
    for i in 0..<creatures.count {
        for j in i + 1..<creatures.count {
            let creature1 = creatures[i]
            let creature2 = creatures[j]
            creature1.interactWith(creature2)
        }
    }
}

describeCreatureInteractions(creatures: creatureCatalog)
