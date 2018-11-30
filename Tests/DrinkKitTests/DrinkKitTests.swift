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
    let drinks : [Drink] = [Drink(Alcohol: .wine)]
    
    let Janice = User(Sex: .female, Weight: 120, Feet: 5, Inches: 2)
    let BAC = BloodAlcoholContent(user: Janice)
    
    XCTAssertEqual(BAC.Get(with: drinks, started: thirtyMinsAgo), 0.029, "Female BAC Wrong")
  }
  
  
  func testGetBACMale() {
    let twoHoursAgo = Calendar.current.date(byAdding: .hour, value: -2, to: Date())!
    
    let Drinks : [Drink] = [Drink(Alcohol: .spirit), Drink(Alcohol: .beer), Drink(Alcohol: .wine)]
    
    let John = User(Drinks: Drinks)
    let BAC = BloodAlcoholContent(user: John)
    
    XCTAssertEqual(BAC.Get(with: Drinks, started: twoHoursAgo), 0.045, "Male BAC Wrong")
  }
  
  func testBACPercentage() {
    let twoHoursAgo = Calendar.current.date(byAdding: .hour, value: -2, to: Date())!
    
    let Drinks : [Drink] = [Drink(Alcohol: .spirit), Drink(Alcohol: .beer), Drink(Alcohol: .wine)]
    
    let John = User(Drinks: Drinks)
    let BAC = BloodAlcoholContent(user: John)
    
    XCTAssertEqual(BAC.Get(with: Drinks, started: twoHoursAgo).percantage, "0.045%", "Male BAC Wrong")
  }
  
  func testTimeSober() {
    let John = User(Sex: .male)
    let BAC = BloodAlcoholContent(user: John)
    
    XCTAssertNotEqual(BAC.Time(when: .Sober, current: 0.08), Date(), "Wrong Time")
  }
  
  func testTimeSoberUntilLegalLimit() {
    let John = User(Sex: .male)
    let BAC = BloodAlcoholContent(user: John)
    
    XCTAssertLessThan(BAC.Time(when: .USLegalLimit, current: 0.08), Date(), "Wrong Time")
  }
  
  func testFutureTime() {
    let twoHoursAhead = Calendar.current.date(byAdding: .hour, value: 2, to: Date())!

    let Drinks : [Drink] = [Drink(Alcohol: .spirit), Drink(Alcohol: .beer), Drink(Alcohol: .wine)]
    let John = User(Drinks: Drinks)
    let BAC = BloodAlcoholContent(user: John)
    
    XCTAssertEqual(BAC.Get(with: Drinks, started: twoHoursAhead), 0.0, "Wrong BAC")
  }
  
  func testImperialUser() {
    let weight = 72.5748
    let John = User(Sex: .male, kilogram: weight)
    
    XCTAssertLessThanOrEqual(John.Weight, User.Pounds(weight * 2.20462), "Wrong Time")
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
