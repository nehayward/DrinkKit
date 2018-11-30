<p align="center"/>
    <img src="Logo.gif" />
</p>
<p align="center">
    <img src="https://img.shields.io/badge/Swift-4.2-orange.svg" />
    <a href="https://github.com/Carthage/Carthage">
        <img src="https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat" alt="Carthage" />
    </a>
    <img src="https://img.shields.io/badge/platforms-iOS|watchOS|macOS-black.svg?&longCache=true&style=flat" alt="Platforms" />
    <a href="https://twitter.com/nehayward">
        <img src="https://img.shields.io/badge/contact-@nehayward-51CEDA.svg?style=flat" alt="Twitter: @nehayward" />
    </a>
</p>

Welcome to **Drinkkit**, easily calculate your Blood Alcohol Content level. It can be used to get your current Blood Alcohol Content or calculate when you'll be sober.

## 👨‍💻 Quick Start

Clone the project and open up the [playground workspace](Playground/DrinkKitQuickstart.workspace). Then build iOS target.

```swift
import Foundation
import DrinkKit

// Create User
let John = User(Sex: .male)

let BAC = BloodAlcoholContent(user: John)

// Set Started Drinking Time
let thirtyMinsAgo = Calendar.current.date(byAdding: .minute, value: -30, to: Date())!
let drinks : [Drink] = [Drink(Alcohol: .wine)]

let currentBAC = BAC.Get(with: drinks, started: thirtyMinsAgo)

print(currentBAC.percantage)
print(drinks)
```

## Usage

🥃 **Calculate your Blood Alcohol Content**

> Ensure you have `import DrinkKit`.

```swift
let oneHourAgo = Calendar.current.date(byAdding: .hour, value: -1, to: Date())!
let drinks : [Drink] = [Drink(Alcohol: .beer)]

let Janice = User(Sex: .female, Weight: 120, Feet: 5, Inches: 2)
let BAC = BloodAlcoholContent(user: Janice)

let currentBAC = BAC.Get(with: drinks, started: thirtyMinsAgo)
print(currentBAC.percantage)
```


⏱ **See When you'll be Sober**

```swift
let John = User(Sex: .male)
let BAC = BloodAlcoholContent(user: John)

let date = BAC.Time(when: .Sober, current: 0.08)

print(date)
```

## Installation

You can download the latest frameworks from the [release section](https://github.com/nehayward/drinkkit/releases) or use [Carthage](https://github.com/Carthage/Carthage#installing-carthage). Please follow their instructions for downloading.

## Please enjoy **Drinkkit**, prost

This is my first open source project, I hope you enjoy it and I would appreciate any feedback. Let me know what you think on on [Twitter](https://twitter.com/nehayward) 😊
