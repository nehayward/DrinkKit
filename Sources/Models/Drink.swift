//
//  Drink.swift
//  DrinkKit
//
//  Created by Nick Hayward on 10/21/18.
//  Copyright © 2018 Nick Hayward. All rights reserved.
//

import Foundation

public enum Kind: String {
  case beer
  case wine
  case distilled
}

public struct Drink {
  public typealias Ounce = Double
  
  public let volume: Ounce
  public let ABV: Double
  public let time : Date
  public let alcohol: Alcohol
  public let style: String
  
  var ethanol: Double {
    return volume * ABV
  }
  
  public init(volume: Ounce = 12,
              ABV: Double = 0.050,
              time: Date = Date(),
              alcohol: Alcohol = .beer,
              style: String = "") {
    self.volume = volume
    self.ABV = ABV
    self.time = time
    self.alcohol = alcohol
    self.style = style
  }
}

extension Drink {
  public init(alcohol: Alcohol,
              time: Date = Date(),
              style: String = "") {
    self.time = time
    self.style = style
    
    switch alcohol {
    case .wine:
      self.volume = 5
      self.ABV = 0.12
      self.alcohol = alcohol
    case .spirit:
      self.volume = 1.5
      self.ABV = 0.40
      self.alcohol = alcohol
    case .beer:
      self.volume = 12
      self.ABV = 0.050
      self.alcohol = alcohol
    }
  }
}

extension Drink : CustomStringConvertible {
  public var description: String {
    return "\(alcohol)" + (style == "" ? "" : " (\(style))") + " \(volume)oz \(ABV * 100)% ABV at \(time)"
  }
}
