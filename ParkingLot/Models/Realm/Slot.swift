//
//  Slot.swift
//  ParkingLot
//
//  Created by Rahul  Belekar on 05/07/20.
//  Copyright © 2020 Company. All rights reserved.
//

import RealmSwift

///Database Slot Object
class Slot: Object {
    @objc dynamic var id = 0
    @objc dynamic var row = 0
    @objc dynamic var level = 0
    @objc dynamic var type: SpaceType = .Motorcycle
    @objc dynamic var vehicle: Vehicle?
    
    convenience init(id: Int, row: Int, level: Int, type: SpaceType) {
        self.init()
        self.id = id
        self.row = row
        self.level = level
        self.type = type
    }
    
    required init() {
        id = 0
        row = 0
        level = 0
        type = .Motorcycle
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

