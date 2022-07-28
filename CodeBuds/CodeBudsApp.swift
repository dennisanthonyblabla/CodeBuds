//
//  CodeBudsApp.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 21/07/22.
//

import SwiftUI

@main
struct CodeBudsApp: App {
    @StateObject private var coreDataController = DataController()
    

    var body: some Scene {
        WindowGroup {
            Home_ProfilePage()
                .environment(\.managedObjectContext, coreDataController.container.viewContext)
        }
    }
}
