//
//  DashboardViewModel.swift
//  ParkingLot
//
//  Created by Rahul  Belekar on 06/07/20.
//  Copyright © 2020 Company. All rights reserved.
//

import Foundation

///Dashboard Info Model
struct DashboardInfo {
    let available: Int
    let total: Int
    let cars: Int
    let bikes: Int
    let buses: Int
}

///View model for dashboard
class DashboardViewModel: ObservableObject {
    @Published var dashboardData = DashboardInfo(available: 0, total: 0, cars: 0, bikes: 0, buses: 0)
    
    func fetchInfo() {
        guard let slots = SlotsManager.getAllSlots() else { return }
        let total = slots.count
        let available = slots.filter("vehicle == nil").count
        var cars = 0
        var bikes = 0
        var bus = 0
        if let vehicles = VehiclesManager.getAllVehicles() {
            cars = vehicles.filter({ (vehicle) -> Bool in
                return vehicle.vehicleType == VehicleType.Car
            }).count
            bikes = vehicles.filter({ (vehicle) -> Bool in
                return vehicle.vehicleType == VehicleType.Motorcycle
            }).count
            bus = vehicles.filter({ (vehicle) -> Bool in
                return vehicle.vehicleType == VehicleType.Bus
            }).count
        }
        dashboardData = DashboardInfo(available: available, total: total, cars: cars, bikes: bikes, buses: bus)
    }
}
