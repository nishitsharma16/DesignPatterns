//
//  Builder.swift
//  DesignPractice
//
//  Created by Nishit on 07/02/21.
//

import Foundation

protocol CarType {
    func hasFourWheels()
    func hasLongWheelBase()
    func hasStiering()
    func hasTacoMeter()
    func maxSpeed()
}

protocol CarCreaterType {
    func setEngine()
    func setWheels()
    func setSeats()
    func setTacoMeter()
    func setMaxSpeed()
}

typealias Car = CarType & CarCreaterType

struct SportsCar: Car {
    func setEngine() {
        
    }
    
    func setWheels() {
        
    }
    
    func setSeats() {
        
    }
    
    func setTacoMeter() {
        
    }
    
    func setMaxSpeed() {
        
    }
    
    func hasFourWheels() {
        
    }
    
    func hasLongWheelBase() {
        
    }
    
    func hasStiering() {
        
    }
    
    func maxSpeed() {
        
    }
    
    func hasTacoMeter() {
        
    }
}

protocol BuilderSteps {
    func reset()
    func stepA()
    func stepB()
    func stepC()
}

protocol Result {
    func result() -> CarType
}

typealias Builder = BuilderSteps & Result

struct SportsCarBuilder: Builder {
    
    let car: Car = SportsCar()
    
    func reset() {
        
    }
    
    func stepA() {
        
    }
    
    func stepB() {
        
    }
    
    func stepC() {
        
    }
    
    func result() -> CarType {
        return car
    }
}

struct Director {
    let carBuilder: Builder
    init(_ builder: Builder) {
        carBuilder = builder
    }
    func process() {
        carBuilder.self.stepA()
        carBuilder.self.stepB()
        carBuilder.self.stepC()
    }
}
