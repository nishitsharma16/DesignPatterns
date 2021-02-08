//
//  Adapter.swift
//  DesignPractice
//
//  Created by Nishit on 07/02/21.
//

import Foundation

protocol FirstObjectDataSource: AnyObject {
    func getData() -> Any?
}

protocol FirstObjectDelegate: AnyObject {
    func tapView()
}

class FirstObject {
    weak var dataSource: FirstObjectDataSource?
    weak var delegate: FirstObjectDelegate?

    func createList() {
        let _ = dataSource?.getData()
    }
    
    func viewTapped() {
        delegate?.tapView()
    }
}

class SecondObject {
    
}

extension SecondObject: FirstObjectDataSource {
    func getData() -> Any? {
        return nil
    }
}

extension SecondObject: FirstObjectDelegate {
    func tapView() {
        
    }
}

class AdapterClient {
    let secondObject = SecondObject()
    lazy var first: FirstObject = {
        let object = FirstObject()
        object.dataSource = secondObject
        object.delegate = secondObject
        return object
    }()
    func setUpAdapter() {
        
    }
}

struct Data {
    let data: String
}

struct ClientData {
    let data: Array<String>
}

class Service {
    func sendData(_ data: Data) {
        
    }
}

protocol ClientToServiceAdapterType {
    func sendDataToService(_ data: ClientData)
}

class Adapter {
    let service = Service()
}

extension ClientData {
    func toServiceData() -> Data {
        let result = data.reduce("") { (prev, curr) -> String in
            prev + curr
        }
        return Data(data: result)
    }
}

extension Adapter: ClientToServiceAdapterType {
    func sendDataToService(_ data: ClientData) {
        let serviceData = data.toServiceData()
        service.sendData(serviceData)
    }
}

class AdapterClientTwo {
    let adapter: ClientToServiceAdapterType = Adapter()
    func doWork() {
        let data = ClientData(data: ["Nishit"])
        adapter.sendDataToService(data)
    }
}
