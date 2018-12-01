//
//  DrinkKind.swift
//  DrinkKit
//
//  Created by Nick Hayward on 10/22/18.
//  Copyright © 2018 Nick Hayward. All rights reserved.
//

import Foundation

public enum Alcohol: String {
  case beer
  case wine
  case spirit
}

extension Alcohol: CustomStringConvertible {
  public var description: String {
    return self.rawValue.capitalized
  }
}
