//
//  Dashboard.swift
//  ParkingLot
//
//  Created by Rahul  Belekar on 06/07/20.
//  Copyright © 2020 Company. All rights reserved.
//

import SwiftUI

struct Dashboard: View {
    var dashboardVM = DashboardViewModel()
    @State var dashboardData = DashboardInfo(available: 0, total: 0, cars: 0, bikes: 0, buses: 0)
    @State var showAddVehicle = false
    @State var showVehicleListing = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Available Slots: \(dashboardData.available)/\(dashboardData.total)").bold().padding().shadow(radius: 2)
                HStack(spacing: 0) {
                    VStack {
                        Text("Motorcycle").bold().shadow(radius: 2)
                        Text("\(dashboardData.bikes)").font(.largeTitle)
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    Spacer()
                    VStack {
                        Text("Car").bold().shadow(radius: 2)
                        Text("\(dashboardData.cars)").font(.largeTitle)
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    Spacer()
                    VStack {
                        Text("Bus").bold().shadow(radius: 2)
                        Text("\(dashboardData.buses)").font(.largeTitle)
                    }.frame(minWidth: 0, maxWidth: .infinity)
                }
                Spacer()
                HStack {
                    NavigationLink(destination: AddVehicle(showSheetView: $showAddVehicle), isActive: $showAddVehicle) {
                        Text("Add Vehicle").padding().border(Color.blue).shadow(radius: 2)
                    }
                    Spacer()
                    NavigationLink(destination: VehicleListing(showVehicleListing: $showVehicleListing), isActive: $showVehicleListing) {
                        Text("Show Vehicles").padding().border(Color.blue).shadow(radius: 2)
                    }
                }
            }.onAppear() {
                self.dashboardVM.fetchInfo()
            }.onReceive(dashboardVM.$dashboardData) { (output) in
                self.dashboardData = output
            }.padding().navigationBarTitle("Parking Lot")
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
