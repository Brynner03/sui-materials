//
//  ContentView.swift
//  MountainAirportMac
//
//  Created by Brynner Ventura on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var flightInfo = FlightData()
    
    @SceneStorage("displayState")
    var displayState: DisplayState = .none
    @SceneStorage("lastViewedFlightID") var lastViewedFlightID: Int?
    @SceneStorage("selectedFlightID") var selectedFlightID: Int?
    
    var selectedFlight: FlightInformation? {
        if let id = selectedFlightID {
            return flightInfo.getFlightById(id)
        }
        return nil
    }
    
    var lastViewedFlight: FlightInformation? {
        if let id = lastViewedFlightID {
            return flightInfo.getFlightById(id)
        }
        return nil
    }
    
    var body: some View {
        NavigationView {
            WelcomeView(flightInfo: flightInfo)
            
            switch displayState {
            case .none:
                EmptyView()
            case .flightBoard:
                HStack {
                    FlightStatusBoard(
                        flights: flightInfo.getDaysFlights(Date())
                    )
                    FlightDetails(flight: selectedFlight)
                }
            case .searchFlights:
                SearchFlights(flightData: flightInfo.flights)
            case .awards:
                AwardsView()
            case .timeline:
                FlightTimelineView(
                    flights: flightInfo.flights.filter {
                        Calendar.current.isDate(
                            $0.localTime,
                            inSameDayAs: Date()
                        )
                    }
                )
            case .lastFlight:
                FlightDetails(flight: lastViewedFlight)
            }
        }
        .navigationTitle("Mountain Airport")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
