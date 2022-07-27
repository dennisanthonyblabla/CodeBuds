//
//  CDController.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 25/07/22.
//

import Foundation
import CoreData
import CloudKit

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
//        guard let description = container.persistentStoreDescriptions.first else {
//            fatalError("it's an error")
//        }
//        description.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
//        description.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
//
//        let publicOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: "iCloud.com.Dennis-Anthony.CodeBuds")
//        publicOptions.databaseScope = .public
        
        guard let description = container.persistentStoreDescriptions.first else {
             print("Can't set description")
             fatalError("Error")
         }
            
         description.cloudKitContainerOptions?.databaseScope = .public
        
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
