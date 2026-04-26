//
//  Coding_Practice_InterviewApp.swift
//  Coding-Practice-Interview
//
//  Created by Ajeet Sharma on 24/04/26.
//

import SwiftUI

@main
struct Coding_Practice_InterviewApp: App {
    /*
     “@Environment is used in SwiftUI to access shared system or app-level values passed implicitly through the view hierarchy.”
     
     */
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { oldValue, newValue in
            switch newValue {
            case .background:
                print("App is background")
            case .inactive:
                print("App is inactive")
            case .active:
                print("App is active")
            @unknown default:
                fatalError()
            }
        }
        
    }
}
