//
//  Drink.swift
//  DrinkKit
//
//  Created by Nick Hayward on 10/21/18.
//  Copyright © 2018 Nick Hayward. All rights reserved.
//

import Foundation

public enum Kind : String {
  case beer
  case wine
  case distilled
}

public struct Drink {
  public typealias Ounce = Double
  
  public let Volume: Ounce
  public let ABV: Double
  public let Time : Date
  public let Alcohol: Alcohol
  public let Style: String
  
  var Ethanol : Double {
    return Volume * ABV
  }
  
  public init(Volume: Ounce = 12, ABV: Double = 0.055, Time: Date = Date(), Alcohol: Alcohol = .beer, Style: String = "") {
    self.Volume = Volume
    self.ABV = ABV
    self.Time = Time
    self.Alcohol = Alcohol
    self.Style = Style
  }
}

extension Drink {
  public init(Alcohol: Alcohol, Time : Date = Date(), Style: String = "") {
    self.Time = Time
    self.Style = Style
    
    switch Alcohol {
    case .wine:
      self.Volume = 5
      self.ABV = 0.12
      self.Alcohol = Alcohol
      
    case .spirit:
      self.Volume = 1.5
      self.ABV = 0.40
      self.Alcohol = Alcohol
    default:
      self.Volume = 12
      self.ABV = 0.050
      self.Alcohol = Alcohol
    }
  }
}

