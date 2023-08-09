//
//  MenuCommands.swift
//  MacMarkDown
//
//  Created by Brynner Ventura on 8/8/23.
//

import SwiftUI

struct MenuCommands: Commands {
    @AppStorage("styleSheet")
    var styleSheet: StyleSheet = .github
    
    var body: some Commands {
        CommandGroup(before: .help) {
            Button("Markdown CheatSheet") {
                showCheatSheet()
            }
            .keyboardShortcut("/", modifiers: .command)
            Divider()
        }
        CommandMenu("Stylesheet") {
            ForEach(StyleSheet.allCases, id: \.self) { style in
                Button(style.rawValue) {
                    styleSheet = style
                }
                .keyboardShortcut(style.shortcutKey, modifiers: .command)
            }
        }
    }
    
    func showCheatSheet() {
        let cheatSheetAddress = "https://github.com/adam-p/markdown-here/wiki/Markdonw-Cheatsheet"
        
        guard let url = URL(string: cheatSheetAddress) else {
            fatalError("Invalid cheatsheet URL")
        }
        NSWorkspace.shared.open(url)
    }
}
