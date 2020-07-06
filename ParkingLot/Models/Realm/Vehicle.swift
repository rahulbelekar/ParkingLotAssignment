//
//  Vehicle.swift
//  ParkingLot
//
//  Created by Rahul  Belekar on 05/07/20.
//  Copyright © 2020 Company. All rights reserved.
//

import Foundation
import RealmSwift

///Database Vehicle Object
/**
 Initially i had created `Vehicle` class and created subclss `Motorcycle`, `Car`, `Bus`. But by doing this there was redundancy in the database so removed this approach.
 Since swift does not provide multiple inheritance i had to create only one class
*/
class Vehicle: Object {
    @objc dynamic var licensePlate: String = ""
    @objc dynamic var spotRequired: Int = 1
    @objc dynamic var vehicleType: VehicleType = .Motorcycle
    var spotsAlloted = List<Int>()
    
    ///Fetch slot data for slot id
    var slotData: Slot? {
        get {
            let realm = try? Realm()
            let obj = realm?.object(ofType: Slot.self, forPrimaryKey: spotsAlloted[0])
            return obj
        }
    }
    
    override static func primaryKey() -> String? {
        return "licensePlate"
    }
    
    override static func ignoredProperties() -> [String] {
        return ["vehicleType", "slotData"]
    }
    
    convenience init(licensePlate: String, vehicleType: VehicleType) {
        self.init()
        self.licensePlate = licensePlate
        self.vehicleType = vehicleType
        switch vehicleType {
        case .Motorcycle, .Car:
            spotRequired = 1
        case .Bus:
            spotRequired = 5
        }
    }
    
    required init() {
        licensePlate = ""
        spotRequired = 0
        vehicleType = .Motorcycle
    }
    
    func addSlot(slot: Array<Slot>) {
        for item in slot { spotsAlloted.append(item.id) }
    }
    
    func removeSlots() {
        spotsAlloted.removeAll()
    }

}
