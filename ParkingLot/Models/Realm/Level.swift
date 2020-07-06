//
//  Level.swift
//  ParkingLot
//
//  Created by Rahul  Belekar on 05/07/20.
//  Copyright © 2020 Company. All rights reserved.
//

import RealmSwift

class Level: Object {
    @objc dynamic var id = 0
    @objc dynamic var noOfRows = 0
    @objc dynamic var totalSlots = 0
    @objc dynamic var buildingID = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
