//
//  AddVehicle.swift
//  ParkingLot
//
//  Created by Rahul  Belekar on 05/07/20.
//  Copyright © 2020 Company. All rights reserved.
//

import SwiftUI

///Add vehicle view
struct AddVehicle: View {
    @Binding var showSheetView: Bool
    @State var license: String = ""
    @State private var index = 0
    var carTypes = ["Motorcycle", "Car", "Bus"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Car Information")) {
                    TextField("License Number", text: $license)
                    Picker(selection: $index, label: Text("Select Vehicle Type")) {
                        ForEach(0 ..< carTypes.count) {
                            Text(self.carTypes[$0])
                        }
                    }
                }
                Section {
                    Button(action: {
                        self.addVehicle()
                    }) {
                        Text("Accept Vehicle")
                    }
                }
            }.navigationBarTitle("Add Vehicle")
        }
    }
    
    func addVehicle() {
        guard license != "" else { AppManager.showToast(msg: "Please enter a vehicle number", title: ""); return }
        VehiclesManager.addVehicle(license: license, vehicleType: VehicleType(rawValue: index) ?? .Motorcycle) {
            self.showSheetView = false
        }
    }
}

struct AddVehicle_Previews: PreviewProvider {
    @State static var myBool = false
    static var previews: some View {
        AddVehicle(showSheetView: $myBool)
    }
}
