//
//  Game.swift
//  UsedGames
//
//  Created by Feyza Eda TÜRK on 14.12.2021.
//

import Foundation

class Game : NSObject , Identifiable{
    
    var name : String
    var priceInDollar : Double
    var serialNumber : String
    var dateCreated : Date
    
    init(name : String , priceInDollar : Double , serialNumber : String) {
        self.name = name
        self.priceInDollar = priceInDollar
        self.serialNumber = serialNumber
        self.dateCreated = Date()
    }
    
    convenience init(random :  Bool = false){
        if random{
            let conditions = ["New" , "Mint" , "Used"]
            var idx = arc4random_uniform(UInt32(conditions.count))
            let randomConditions = conditions[Int(idx)]
            let names = ["Resident Evil" , "Gears of War" , "Halo" , "God of War"]
            idx = arc4random_uniform(UInt32(names.count))
            let randomName = names[Int(idx)]
            idx = arc4random_uniform(UInt32(6))
            let randomTitle = "\(randomConditions) \(randomName) \(Int(idx))"
            let serialNumbers = UUID().uuidString.components(separatedBy: "-").first!
            let priceInDollars = Double(arc4random_uniform(UInt32(70)))
            self.init(name : randomTitle , priceInDollar : priceInDollars , serialNumber : serialNumbers)
        }else{
            self.init(name : "" , priceInDollar : 0 , serialNumber : "")
        }
    }
    
}
