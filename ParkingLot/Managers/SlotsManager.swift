//
//  SlotsManager.swift
//  ParkingLot
//
//  Created by Rahul  Belekar on 05/07/20.
//  Copyright © 2020 Company. All rights reserved.
//

import Foundation
import RealmSwift

//Class managing slot records in Database
class SlotsManager {
    static func getFreeSlot(vehicleType: VehicleType) -> Array<Slot>? {
        let realm = try? Realm()
        switch vehicleType {
        case .Motorcycle:
            guard let slot = realm?.objects(Slot.self).sorted(byKeyPath: "id").first(where: { (slot) -> Bool in
                return slot.vehicle == nil
            }) else { return nil }
            return [slot]
        case .Car:
            guard let slot = realm?.objects(Slot.self).sorted(byKeyPath: "id").first(where: { (slot) -> Bool in
                return slot.vehicle == nil && ([SpaceType.Compact, SpaceType.Large].contains(slot.type))
            }) else { return nil }
            return [slot]
        case .Bus:
            let objs = realm?.objects(Slot.self).sorted(byKeyPath: "id").filter("vehicle == nil AND type == 2")
            guard let slots = objs else { return nil } //No Slots Available
            for idx in 0..<slots.count {
                let x = idx + 4
                if x < slots.count {
                    if slots[idx].id + 4 == slots[x].id {
                        return [slots[idx], slots[idx + 1], slots[idx + 2], slots[idx + 3], slots[idx + 4]]
                    }
                }
            }
            return nil
        }
    }
    
    static func getAllSlots() -> Results<Slot>? {
        let realm = try? Realm()
        let objs = realm?.objects(Slot.self)
        return objs
    }
    
    static func updateSlot(id: Int) {
        let realm = try? Realm()
        let obj = realm?.object(ofType: Slot.self, forPrimaryKey: id)
        try? realm?.write {
            obj?.vehicle = nil
        }
    }
}
