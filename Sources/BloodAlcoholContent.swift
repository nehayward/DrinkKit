//
//  BloodAlcoholContent.swift
//  DrinkKit
//
//  Created by Nick Hayward on 10/21/18.
//  Copyright © 2018 Nick Hayward. All rights reserved.
//

import Foundation

public class BloodAlcoholContent {
  public let user: User
  
  public init(user: User){
    self.user = user
  }

  public func get(with drinks: [Drink],
                  started time: Date) -> BAC {
    guard time <= Date(),
          let duration = Calendar.current.dateComponents([.minute], from: time, to: Date()).minute else {
      return 0.0
    }

    let waterPercent = (user.sex == .male) ? 0.6 : 0.55
  
    let gramsPerOzEtOH = 23.36 //A constant: 29.57 ml/oz X .79 g/ml = 23.36 grams/oz

    //B) Find total body water
    let bodyWaterML = user.mass * waterPercent * 1000  //Men have a higher water content than women
    //C) cGramsPerOzEtOH is a constant variable (above)
    //D) Find alcohol per mL of water
    let totalEthanol = drinks.reduce(into: 0) { $0 += $1.ethanol }

    let totalEthanolInWater = gramsPerOzEtOH * totalEthanol / bodyWaterML
    //E) Find alcohol per mL of blood
    let alcoholInBlood = totalEthanolInWater * 0.806 //Blood is 80.6% water
    
    //F) Convert mConcEtOHinBlood from g/mL to g/100 mL (gram percent)
    let gramPercentEtOHinBlood = alcoholInBlood * 100
    
    //Note: mGramPercentEtOHinBlood is the BAC with instant consumption, absorption, and distribution
    let BAC = gramPercentEtOHinBlood - (user.metabolicRate.rawValue * Double(duration)/60)
    
    return (round(BAC * 1000)/1000) > 0 ? (round(BAC * 1000)/1000) : 0.0
  }
  
  public func time(when level: Level = .sober,
                   current BAC: BAC,
                   for metabolicRate: MetabolicRate = .standard) -> Date {
    let timeSober = (Double(BAC - level.rawValue) / metabolicRate.rawValue * 10000) / 10000
    return Calendar.current.date(byAdding: .minute, value: Int(round(timeSober * 60)), to: Date()) ?? Date()
  }
}
