//
//  CDController.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 25/07/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    static let shared = DataController()
    let container: NSPersistentCloudKitContainer
    
    init() {
        container = NSPersistentCloudKitContainer(name: "CDProjects")
        
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
//                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
