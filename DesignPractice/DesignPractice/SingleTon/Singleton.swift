//
//  Singleton.swift
//  DesignPractice
//
//  Created by Nishit on 07/02/21.
//

import Foundation

// This pattern violates the single responsibilty principle. It's hard to test. We have to support thread safety. It provides bad design when program knows too much of each other.
final class ProductManager {
    static let shared = ProductManager()
    private init() {
        
    }
}
