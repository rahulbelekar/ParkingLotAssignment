//
//  ImportManager.swift
//  ParkingLot
//
//  Created by Rahul  Belekar on 05/07/20.
//  Copyright © 2020 Company. All rights reserved.
//

import Foundation
import SwiftCSV
import RealmSwift

///Importing Data for Parking Lot
func importDataFromCSV() {
    guard UserDefaults.standard.bool(forKey: "DataAdded") == false else {
        return
    }
    let resource : CSV? = try? CSV(name: "Slots", extension: "csv", bundle: .main, delimiter: ",", encoding: .utf8, loadColumns: true)
    guard let csv = resource else { return }
    for item in csv.enumeratedRows {
        let id = Int(item[0]) ?? 0
        let row = Int(item[1]) ?? 0
        let level = Int(item[2]) ?? 0
        let type = SpaceType(rawValue: Int(item[3]) ?? 0) ?? SpaceType.Motorcycle
        let slot = Slot(id: id, row: row, level: level, type: type)
        let realm = try? Realm()
        try? realm?.write {
            realm?.add(slot)
        }
    }
    UserDefaults.standard.set(true, forKey: "DataAdded")
    UserDefaults.standard.synchronize()
}
