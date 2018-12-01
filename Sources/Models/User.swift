//
//  Profile.swift
//  DrinkKit
//
//  Created by Nick Hayward on 10/21/18.
//  Copyright © 2018 Nick Hayward. All rights reserved.
//

import Foundation

public struct User {
  public typealias Kilograms = Double
  public typealias Meters = Double
  public typealias Feet = Int
  public typealias Inches = Int
  public typealias Pounds = Int
  
  public let sex: Sex
  public let weight: Pounds
  public let BAC: BAC?
  public let drinks: [Drink]
  public let metabolicRate: MetabolicRate
  
  var mass: Kilograms {
    return Double(weight) / 2.205
  }
  
  public init(sex: Sex = .male,
              weight: Pounds = 160,
              feet: Feet = 5,
              inches: Inches = 11,
              BAC: BAC = 0.0,
              metabolicRate: MetabolicRate = .standard,
              drinks: [Drink] = []){
    
    self.sex = sex
    self.weight = weight
    self.BAC = BAC
    self.drinks = drinks
    self.metabolicRate = metabolicRate
  }
}

extension User {
  public init(sex: Sex = .male,
              kilogram weight: Kilograms = 72,
              BAC: BAC = 0.0,
              metabolicRate: MetabolicRate = .standard,
              drinks: [Drink] = []){
    self.sex = sex
    self.weight = Pounds(weight * 2.20462)
    self.BAC = BAC
    self.drinks = drinks
    self.metabolicRate = metabolicRate
  }
}
