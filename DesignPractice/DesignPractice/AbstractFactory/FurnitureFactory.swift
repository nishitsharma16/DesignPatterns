//
//  FurnitureFactory.swift
//  DesignPractice
//
//  Created by Nishit on 06/02/21.
//

import Foundation

// Abstract Factory pattern will be used when we need to create different type of related product like table, chair and sofa for living area. So when we need to create set of related products then it's best suited to gather factory method under one Protocol and implement it in it's concreate implementation.
protocol Table {
    func hasLegs()
    func hasBoard()
}

protocol Chair {
    func hasLegs()
    func hasSit()
}

protocol Sofa {
    func hasLegs()
    func hasCusion()
}

struct MordenChair: Chair {
    func hasLegs() {
        
    }
    
    func hasSit() {
        
    }
}

struct MordenTable: Table {
    func hasLegs() {
        
    }
    
    func hasBoard() {
        
    }
}

struct MordenSofa: Sofa {
    func hasLegs() {
        
    }
    
    func hasCusion() {
        
    }
}

struct VictorianChair: Chair {
    func hasLegs() {
        
    }
    
    func hasSit() {
        
    }
}

struct VictorianTable: Table {
    func hasLegs() {
        
    }
    
    func hasBoard() {
        
    }
}

struct VictorianSofa: Sofa {
    func hasLegs() {
        
    }
    
    func hasCusion() {
        
    }
}

protocol FurnitureFactory {
    static func createTable() -> Table
    static func createChair() -> Chair
    static func createSofa() -> Sofa
}

struct MordenFurnitureFactory: FurnitureFactory {
    static func createTable() -> Table {
        return MordenTable()
    }
    
    static func createChair() -> Chair {
        return MordenChair()
    }
    
    static func createSofa() -> Sofa {
        return MordenSofa()
    }
}

struct VictorianFurnitureFactory: FurnitureFactory {
    static func createTable() -> Table {
        return VictorianTable()
    }
    
    static func createChair() -> Chair {
        return VictorianChair()
    }
    
    static func createSofa() -> Sofa {
        return VictorianSofa()
    }
}


struct Client {
    func getFurnitures(factory: FurnitureFactory) {
        let mordernFactoryChair = type(of: factory).createChair()
    }
}
