//
//  Vehicle.swift
//  ParkingLot
//
//  Created by Rahul  Belekar on 04/07/20.
//  Copyright © 2020 Company. All rights reserved.
//

import Foundation

//class Vehicle {
//    fileprivate var parkingSpaces: Array<ParkingSpace> = Array<ParkingSpace>()
//    fileprivate var spotsNeeded: Int = 1
//    fileprivate var size: VehicleType = .Motorcycle
//    var licensePlate: String
//    
//    init(licensePlate: String) {
//        self.licensePlate = licensePlate
//    }
//    
//    func getSlot() -> Int {
//        return spotsNeeded
//    }
//    
//    func getVehicleType() -> VehicleType {
//        return size
//    }
//    
//    func parkingSpace(space: ParkingSpace) {
//        parkingSpaces.append(space)
//    }
//    
//    func clearSpace() {
//        
//    }
//    
//    func canFitInSpot(space: ParkingSpace) -> Bool {
//        return true
//    }
//}
//
//class Motocycle: Vehicle {
//    override init(licensePlate: String) {
//        super.init(licensePlate: licensePlate)
//        self.spotsNeeded = 1
//        self.size = .Motorcycle
//    }
//    
//    override func canFitInSpot(space: ParkingSpace) -> Bool {
//        return true
//    }
//}
//
//class Car: Vehicle {
//    override init(licensePlate: String) {
//        super.init(licensePlate: licensePlate)
//        self.spotsNeeded = 1
//        self.size = .Compact
//    }
//    
//    override func canFitInSpot(space: ParkingSpace) -> Bool {
//        return true
//    }
//}
//
//class Bus: Vehicle {
//    override init(licensePlate: String) {
//        super.init(licensePlate: licensePlate)
//        self.spotsNeeded = 5
//        self.size = .Large
//    }
//    
//    override func canFitInSpot(space: ParkingSpace) -> Bool {
//        return true
//    }
//}
//
