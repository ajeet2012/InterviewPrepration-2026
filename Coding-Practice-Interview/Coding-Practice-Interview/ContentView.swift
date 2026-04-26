//
//  ContentView.swift
//  Coding-Practice-Interview
//
//  Created by Ajeet Sharma on 24/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        var attributeString = AttributedString("Hello world click here")
        
        if let range = attributeString.range(of: "world") {
            attributeString[range].foregroundColor = .blue
            attributeString[range].font = .boldSystemFont(ofSize: 18)
        }
        
        if let range = attributeString.range(of: "Hello") {
            attributeString[range].foregroundColor = .red
        }
        
        if let range = attributeString.range(of: "click here") {
            attributeString[range].link = URL(string: "https://www.apple.com")
            attributeString[range].foregroundColor = .blue
            attributeString[range].underlineStyle = .single
        }
        return Text(attributeString)
    }
}

#Preview {
    ContentView()
}
