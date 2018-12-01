//
//  DrinkKitTests.swift
//  DrinkKit
//
//  Created by Nick Hayward on 11/9/18.
//  Copyright © 2018 DrinkKit. All rights reserved.
//

import Foundation
import XCTest
import DrinkKit

class DrinkKitTests: XCTestCase {
  func testGetBACFemale() {
    let thirtyMinsAgo = Calendar.current.date(byAdding: .minute, value: -30, to: Date())!
    let drinks = [Drink(alcohol: .wine)]
    
    let janice = User(sex: .female, weight: 120, feet: 5, inches: 2)
    let BAC = BloodAlcoholContent(user: janice)
    
    XCTAssertEqual(BAC.get(with: drinks, started: thirtyMinsAgo), 0.029, "Female BAC Wrong")
  }
  
  
  func testGetBACMale() {
    let twoHoursAgo = Calendar.current.date(byAdding: .hour, value: -2, to: Date())!
    let alcohol: [Alcohol] = [.spirit, .beer, .wine]

    let john = User(drinks: alcohol.map { Drink(alcohol: $0) })
    let BAC = BloodAlcoholContent(user: john)
    
    XCTAssertEqual(BAC.get(with: john.drinks, started: twoHoursAgo), 0.045, "Male BAC Wrong")
  }
  
  func testBACPercentage() {
    let twoHoursAgo = Calendar.current.date(byAdding: .hour, value: -2, to: Date())!

    let alcohol: [Alcohol] = [.spirit, .beer, .wine]

    let john = User(drinks: alcohol.map { Drink(alcohol: $0) })
    let BAC = BloodAlcoholContent(user: john)
    
    XCTAssertEqual(BAC.get(with: john.drinks,
                           started: twoHoursAgo).percentage, "0.045%", "Male BAC Wrong")
  }
  
  func testTimeSober() {
    let John = User(sex: .male)
    let BAC = BloodAlcoholContent(user: John)
    
    XCTAssertNotEqual(BAC.time(when: .sober, current: 0.08), Date(), "Wrong Time")
  }
  
  func testTimeSoberUntilLegalLimit() {
    let John = User(sex: .male)
    let BAC = BloodAlcoholContent(user: John)
    
    XCTAssertLessThan(BAC.time(when: .legalLimitUS, current: 0.08), Date(), "Wrong Time")
  }
  
  func testFutureTime() {
    let twoHoursAhead = Calendar.current.date(byAdding: .hour, value: 2, to: Date())!
    let alcohol: [Alcohol] = [.spirit, .beer, .wine]

    let john = User(drinks: alcohol.map { Drink(alcohol: $0) })
    let BAC = BloodAlcoholContent(user: john)
    
    XCTAssertEqual(BAC.get(with: john.drinks, started: twoHoursAhead), 0.0, "Wrong BAC")
  }
  
  func testImperialUser() {
    let weight = 72.5748
    let john = User(sex: .male, kilogram: weight)
    
    XCTAssertLessThanOrEqual(john.weight, User.Pounds(weight * 2.20462), "Wrong Time")
  }
}
