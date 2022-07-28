//
//  CKVariables.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 28/07/22.
//

import Foundation
import CloudKit

class CloudKitVariables: ObservableObject {
    @Published var projectName: [String] = []
    @Published var framework: [String] = []
    @Published var records: [CKRecord] = []
//    @Published var recordIDs = [CKRecord.ID]()
    
    init() {
        fetchItems()
    }
    
    
    func fetchItems() {
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Projects", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let queryOperation = CKQueryOperation(query: query)
        
//        var returnedPN: [String] = []
//        var returnedF: [String] = []
        var returnedR: [CKRecord] = []
        
        queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
            switch returnedResult {
            case.success(let record):
            
                returnedR.append(record)
//                guard let Pname = record["ProjectName"] as? String else {return}
//                returnedPN.append(Pname)
//
//                guard let framework = record["framework"] as? String else {return}
//                returnedF.append(framework)
            case.failure(let error):
                    print("Error MatchedBlock: \(error)")
            }
            
        }
        
        queryOperation.queryResultBlock = { [weak self] returnedResult in
            print("Returned Result: \(returnedResult)")
            DispatchQueue.main.async {
//                self?.projectName = returnedPN
//                self?.framework = returnedF
                self?.records = returnedR
            }
        }
                                            
        
        addOperation(operation: queryOperation)
    }
    
    func addOperation(operation: CKDatabaseOperation) {
        CKContainer.default().publicCloudDatabase.add(operation)
    }
}




