//
//  Enums.swift
//  ParkingLot
//
//  Created by Rahul  Belekar on 04/07/20.
//  Copyright © 2020 Company. All rights reserved.
//

import RealmSwift

@objc enum VehicleType: Int, RealmEnum {
    case Motorcycle = 0
    case Car = 1
    case Bus = 2
}

@objc enum SpaceType: Int, RealmEnum {
    case Motorcycle = 0
    case Compact = 1
    case Large = 2
}
