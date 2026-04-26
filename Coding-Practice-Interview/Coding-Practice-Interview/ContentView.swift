//
//  ContentView.swift
//  Coding-Practice-Interview
//
//  Created by Ajeet Sharma on 24/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        var attributeString = AttributedString("Hello world")
        
        if let range = attributeString.range(of: "world") {
            attributeString[range].foregroundColor = .blue
            attributeString[range].font = .boldSystemFont(ofSize: 18)
        }
        
        if let range = attributeString.range(of: "Hello") {
            attributeString[range].foregroundColor = .red
        }
        return Text(attributeString)
    }
}

#Preview {
    ContentView()
}
