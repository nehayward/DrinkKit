//
//  BloodAlcoholContent.swift
//  DrinkKit
//
//  Created by Nick Hayward on 10/21/18.
//  Copyright © 2018 Nick Hayward. All rights reserved.
//

import Foundation

public class BloodAlcohol {
  public let person: Person
  
  public init(person: Person){
    self.person = person
  }

  public func Get(with drinks : [Drink], started time: Date) -> BAC {
    guard let duration = Calendar.current.dateComponents([.minute], from: time, to: Date()).minute else {
      return 0.0
    }

    let waterPercent = (person.Sex == .male) ? 0.6 : 0.55
  
    let gramsPerOzEtOH = 23.36; //A constant: 29.57 ml/oz X .79 g/ml = 23.36 grams/oz

    //B) Find total body water
    let bodyWaterML = person.Mass * waterPercent * 1000;  //Men have a higher water content than women
    //C) cGramsPerOzEtOH is a constant variable (above)
    //D) Find alcohol per mL of water
    let totalEthanol = drinks.reduce(0){ $0 + $1.Ethanol }

    let totalEthanolInWater = gramsPerOzEtOH * totalEthanol / bodyWaterML;
    //E) Find alcohol per mL of blood
    let alcoholInBlood = totalEthanolInWater * 0.806; //Blood is 80.6% water
    //F) Convert mConcEtOHinBlood from g/mL to g/100 mL (gram percent)
    let gramPercentEtOHinBlood = alcoholInBlood * 100;
    //Note: mGramPercentEtOHinBlood is the BAC with instant consumption, absorption, and distribution
    let BAC = gramPercentEtOHinBlood - (person.MetabolicRate.rawValue * Double(duration)/60);
    
    return round(BAC * 1000)/1000
  }
}
