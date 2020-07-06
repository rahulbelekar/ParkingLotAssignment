//
//  VehicleListing.swift
//  ParkingLot
//
//  Created by Rahul  Belekar on 06/07/20.
//  Copyright © 2020 Company. All rights reserved.
//

import SwiftUI

///Vehicle Listing and search page
struct VehicleListing: View {
    @Binding var showVehicleListing: Bool
    @State var searchTxt: String = ""
    @State var results: Array<Vehicle> = Array<Vehicle>()
    
    var body: some View {
        VStack(spacing: 0) {
            TextField("Search...", text: $searchTxt, onEditingChanged: { (flag) in
                
            }) {
                self.results = VehiclesManager.searchVehicles(str: self.searchTxt) ?? Array<Vehicle>()
            }.frame(height: 40).border(Color.black)
            List {
                ForEach(results, id: \.licensePlate) { item in
                    HStack {
                        Text(item.licensePlate).font(.subheadline).shadow(radius: 2)
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Level: \(item.slotData?.level ?? 0)")
                            Text("Row: \(item.slotData?.row ?? 0)")
                            Text("Slot: \(item.slotData?.id ?? 0)")
                        }
                    }
                }.onDelete(perform: delete(at:))
            }
            Spacer(minLength: 0)
        }.onAppear() {
            self.results = VehiclesManager.searchVehicles(str: self.searchTxt) ?? Array<Vehicle>()
        }
    }
    
    ///Delete Record
    func delete(at offsets: IndexSet) {
        offsets.forEach {
            let data = results[$0]
            results.remove(at: $0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                VehiclesManager.removeVehicle(vehicle: data)
            }
        }
    }
}

struct VehicleListing_Previews: PreviewProvider {
    @State static var myBool = false
    static var previews: some View {
        VehicleListing(showVehicleListing: $myBool)
    }
}
