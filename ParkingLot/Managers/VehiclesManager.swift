//
//  VehiclesManager.swift
//  ParkingLot
//
//  Created by Rahul  Belekar on 05/07/20.
//  Copyright © 2020 Company. All rights reserved.
//

import Foundation
import RealmSwift

//Class managing vehicle records in Database
class VehiclesManager {
    static func addVehicle(license: String, vehicleType: VehicleType, completion: (() -> ())?) {
        let vehicle = Vehicle(licensePlate: license, vehicleType: vehicleType)
        let slot: Array<Slot>? = SlotsManager.getFreeSlot(vehicleType: vehicleType)
        guard let fSlot = slot else { AppManager.showToast(msg: "No Slots Available", title: ""); return }
        vehicle.addSlot(slot: fSlot)
        let realm = try? Realm()
        try? realm?.write {
            realm?.add(vehicle, update: .modified)
            for item in fSlot { item.vehicle = vehicle}
        }
        AppManager.showToast(msg: "Vehicle Added", title: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion?()
        }
    }
    
    static func getAllVehicles() -> Array<Vehicle>? {
        let realm = try? Realm()
        guard let objs = realm?.objects(Vehicle.self) else { return nil }
        return Array(objs)
    }
    
    static func searchVehicles(str: String) -> Array<Vehicle>? {
        if str == "" { return self.getAllVehicles() }
        let realm = try? Realm()
        guard let objs = realm?.objects(Vehicle.self).filter({ (vehicle) -> Bool in
            return vehicle.licensePlate.lowercased().contains(str.lowercased())
        }) else { return nil }
        return Array(objs)
    }
    
    static func removeVehicle(vehicle: Vehicle) {
        let realm = try! Realm()
        let obj = realm.object(ofType: Vehicle.self, forPrimaryKey: vehicle.licensePlate)
        guard let deleteVehicle = obj else { return }
        try! realm.write {
            for slot in deleteVehicle.spotsAlloted {
                let slotObj = realm.object(ofType: Slot.self, forPrimaryKey: slot)
                slotObj?.vehicle = nil
            }
            deleteVehicle.removeSlots()
            realm.delete(deleteVehicle)
        }
    }
}
