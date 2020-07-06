//
//  Row.swift
//  ParkingLot
//
//  Created by Rahul  Belekar on 05/07/20.
//  Copyright © 2020 Company. All rights reserved.
//

import RealmSwift

class Row: Object {
    @objc dynamic var id = 0
    @objc dynamic var noOfSlots = 0
    @objc dynamic var noOfCompactSlots = 0
    @objc dynamic var noOfMotorcycleSlots = 0
    @objc dynamic var noOfLargeSlots = 0
    @objc dynamic var levelID = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
