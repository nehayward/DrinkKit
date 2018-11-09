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
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testGetBACFemale() {
    let thirtyMinsAgo = Calendar.current.date(byAdding: .minute, value: -30, to: Date())!
    let drinks : [Drink] = [Drink(Alcohol: .wine)]
    
    let Janice = Profile(Sex: .female, Weight: 120, Feet: 5, Inches: 2)
    let BAC = BloodAlcoholContent(person: Janice)
    
    XCTAssertEqual(BAC.Get(with: drinks, started: thirtyMinsAgo), 0.029, "Female BAC Wrong")
  }
  
  
  func testGetBACMale() {
    let twoHoursAgo = Calendar.current.date(byAdding: .hour, value: -2, to: Date())!
    
    let Drinks : [Drink] = [Drink(Alcohol: .distilled), Drink(Alcohol: .beer), Drink(Alcohol: .wine)]
    
    let John = Profile(Drinks: Drinks)
    let BAC = BloodAlcoholContent(person: John)
    
    XCTAssertEqual(BAC.Get(with: Drinks, started: twoHoursAgo), 0.047, "Male BAC Wrong")
  }
  
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
