//
//  Storage.swift
//  ToDoList
//
//  Created by Alexey Ivanov on 11/2/23.
//

import UIKit


struct Builing {
    let name: String
    let image: UIImage
    
}

class BuildingStorage {
    
    var list: [Builing] = [
        .init(name: "Miners", image: UIImage (named: "Miner")!),
        .init(name: "Oil Extractors", image: UIImage (named: "Oil Pump")!)
        //TODO:
    ]
    
    func save(building: Builing) {
        list.append(building)
    }
    

}


