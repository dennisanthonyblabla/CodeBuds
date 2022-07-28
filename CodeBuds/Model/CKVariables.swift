//
//  CKVariables.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 28/07/22.
//

import Foundation
import CloudKit


class CloudKitVariables: ObservableObject {

    @Published var records: [CKRecord] = []

    
    init() {
        fetchItems()
    }
    
    func fetchItems() {
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Projects", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let queryOperation = CKQueryOperation(query: query)
        
        var returnedR: [CKRecord] = []
        
        queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
            switch returnedResult {
            case.success(let record):
            
                returnedR.append(record)
            case.failure(let error):
                    print("Error MatchedBlock: \(error)")
            }
            
        }
        
        queryOperation.queryResultBlock = { [weak self] returnedResult in
            print("Returned Result: \(returnedResult)")
            DispatchQueue.main.async {
                self?.records = returnedR
            }
        }
                                            
        
        addOperation(operation: queryOperation)
    }
    
    func addOperation(operation: CKDatabaseOperation) {
        CKContainer.default().publicCloudDatabase.add(operation)
    }
}




