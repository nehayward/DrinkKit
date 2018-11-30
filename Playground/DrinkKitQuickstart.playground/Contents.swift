import Foundation
import DrinkKit

let John = User(Sex: .male)
let BAC = BloodAlcoholContent(user: John)

let thirtyMinsAgo = Calendar.current.date(byAdding: .minute, value: -30, to: Date())!
let drinks : [Drink] = [Drink(Alcohol: .wine)]

let currentBAC = BAC.Get(with: drinks, started: thirtyMinsAgo)

print(currentBAC.percantage)
print(drinks)
