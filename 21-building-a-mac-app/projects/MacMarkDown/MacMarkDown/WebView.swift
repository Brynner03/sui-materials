//
//  WebView.swift
//  MacMarkDown
//
//  Created by Brynner Ventura on 8/8/23.
//

import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    @AppStorage("styleSheet") var styleSheet: StyleSheet = .github
    var formattedHtml: String {
        return """
            <html>
            <head>
                <link href="\(styleSheet).css" rel="stylesheet">
            </head>
            <body>
                \(html)
            </body>
            </html>
            """
    }
    
    var html: String
    
    init(html: String) {
        self.html = html
    }
    
    func makeNSView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        nsView.loadHTMLString(
            formattedHtml,
            baseURL: Bundle.main.resourceURL
        )
    }
}
