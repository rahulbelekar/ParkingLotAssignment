//
//  Building.swift
//  ParkingLot
//
//  Created by Rahul  Belekar on 05/07/20.
//  Copyright © 2020 Company. All rights reserved.
//

import RealmSwift

class Building: Object {
    @objc dynamic var id = 0
    @objc dynamic var noOfFloors = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
