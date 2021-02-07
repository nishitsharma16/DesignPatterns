//
//  Prototype.swift
//  DesignPractice
//
//  Created by Nishit on 07/02/21.
//

import Foundation

// This helps us when we need to get copy of object. Insted of creating new object on client side from the available object, we just have have a Prototype interface which would be implemented at the object itself. It helps us even if some properties are private so if we have a interface implemented at type itself it will be having access to all prpoperties.
protocol Prototype {
    func clone() -> Self
}

struct Product {
    let id: String
    let name: String
}

extension Product: Prototype {
    func clone() -> Product {
        return Product(id: id, name: name)
    }
}

protocol PrototypeRegisteryType {
    mutating func registerItem(_ id: String, _ item: Prototype)
}

protocol PrototypeAccessor {
    func getItem(_ id: String) -> Prototype?
}

struct PrototypeRegistery {
    var items = [String: Prototype]()
}

extension PrototypeRegistery: PrototypeAccessor {
    func getItem(_ id: String) -> Prototype? {
        return items[id]
    }
}

extension PrototypeRegistery: PrototypeRegisteryType {
    mutating func registerItem(_ id: String, _ item: Prototype) {
        items[id] = item
    }
}

struct Client {
    func getProductClone() {
        let id = "123"
        let item: Prototype = Product(id: id, name: "Apple")
        let copy = item.clone()
        var register = PrototypeRegistery()
        register.registerItem(id, item)
        let x = register.getItem(id)
    }
}
