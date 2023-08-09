//
//  MountainAirportMacApp.swift
//  MountainAirportMac
//
//  Created by Brynner Ventura on 8/8/23.
//

import SwiftUI

@main
struct MountainAirportMacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            SidebarCommands()
        }
    }
}


enum DisplayState: Int {
    case none
    case flightBoard
    case searchFlights
    case awards
    case timeline
    case lastFlight
}
