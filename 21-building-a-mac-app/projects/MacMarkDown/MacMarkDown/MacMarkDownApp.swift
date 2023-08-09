//
//  MacMarkDownApp.swift
//  MacMarkDown
//
//  Created by Brynner Ventura on 8/8/23.
//

import SwiftUI

@main
struct MacMarkDownApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: MacMarkDownDocument()) { file in
            ContentView(document: file.$document)
        }
        .commands {
            MenuCommands()
        }
        Settings {
            SettingsView()
        }
    }
}
