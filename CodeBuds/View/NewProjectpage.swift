//
//  NewProjectpage.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 25/07/22.
//

import SwiftUI
import CloudKit

class ProjectViewModel: ObservableObject {
    @Published var ProjectName = ""
    @Published var Framework = ""
    @Published var LearningObjectives = ""
    @Published var Description = ""
    @Published var ContactNumber = ""
}



struct NewProjectpage: View {
    
    @AppStorage("author") private var author: String = ""
    
    let publicDatabase = CKContainer.default().publicCloudDatabase
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = ProjectViewModel()
    @StateObject private var vm = CloudKitVariables()

    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Avenir Heavy", size: 17)!]
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Avenir Black", size: 30)!]
        UINavigationBar.appearance().backgroundColor = UIColor(Color("BGColor"))
    }
    
    var body: some View {

        NavigationView {
            ZStack {
                Color("BGColor").ignoresSafeArea()
                
                Form {
                    Section {
                        VStack {
                            HStack {
                                Text("Project Name")
                                    .font(.custom("Avenir Heavy", size: 18))
                                    .padding(.top, 10)
                                Spacer()
                            }
                            TextField("Name of the Project", text: $viewModel.ProjectName)
                                .font(.custom("Avenir", size: 16))
                        }
                        
                        VStack {
                            HStack {
                                Text("Framework")
                                    .font(.custom("Avenir Heavy", size: 18))
                                    .padding(.top, 10)
                                Spacer()
                            }
                            TextField("SwiftUI or UIKit", text: $viewModel.Framework)
                                .font(.custom("Avenir", size: 16))
                        }
                        
                        VStack {
                            HStack {
                                Text("Learning Objectives")
                                    .font(.custom("Avenir Heavy", size: 18))
                                    .padding(.top, 10)
                                Spacer()
                            }
                            TextField("e.g SwiftUI, TableView", text: $viewModel.LearningObjectives)
                                .font(.custom("Avenir", size: 16))
                        }
                        
                        VStack {
                            HStack {
                                Text("Project Description")
                                    .font(.custom("Avenir Heavy", size: 18))
                                    .padding(.top, 10)
                                Spacer()
                            }
                            TextField("Brief Description", text: $viewModel.Description)
                                .font(.custom("Avenir", size: 16))
                        }
                        
                        VStack {
                            HStack {
                                Text("Contact Details")
                                    .font(.custom("Avenir Heavy", size: 18))
                                    .padding(.top, 10)
                                Spacer()
                            }
                            TextField("e.g Line, Whatsapp", text: $viewModel.ContactNumber)
                                .font(.custom("Avenir", size: 16))
                        }
                        Spacer()
                    }
                }
                
                    .navigationTitle("Create New Project")
                    .navigationBarTitleDisplayMode(.large)
                       .toolbar {
                           ToolbarItem(placement: .navigationBarTrailing) {
                               Button {
                                   print("Clicked Save")
                                   let projectName = viewModel.ProjectName
                                   let framework = viewModel.Framework
                                   let learningObjectives = viewModel.LearningObjectives
                                   let projectDescription = viewModel.Description
                                   let contactNumber = viewModel.ContactNumber
                                   
                                   let record = CKRecord(recordType: "Projects")
                                   
                                   record.setValue(projectName, forKey: "ProjectName")
                                   record.setValue(framework, forKey: "framework")
                                   record.setValue(learningObjectives, forKey: "learningObjectives")
                                   record.setValue(projectDescription, forKey: "projectDescription")
                                   record.setValue(contactNumber, forKey: "contactNumber")
                                   record.setValue(author, forKey: "author")
                                   record.setValue(author, forKey: "owner")
                                   
                                   
                                   
                                   publicDatabase.save(record) { (savedRecord, error) in
                                       if error == nil {
                                           vm.fetchItems()
                                           print("Record Saved Successfully")
                                       } else {
                                           print("Record Not Saved")
                                       }
                                   }
                                   dismiss()
                               } label: {
                                   HStack {
                                       Text("Save")
                                           .font(.custom("Avenir Medium", size: 18))
                                           .foregroundColor(Color("DarkGray"))
                                   }
                               }
                               
                           }
                           ToolbarItem(placement: .navigationBarLeading) {
                               Button (role: .none){
                                   print("clicked")
                                   dismiss()
                               } label: {
                                  HStack {
                                      Image(systemName: "chevron.left")
                                          .renderingMode(.template)
                                          .foregroundColor(Color("DarkGray"))
                                      Text("Back")
                                          .font(.custom("Avenir Medium", size: 18))
                                          .foregroundColor(Color("DarkGray"))
                                  }
                               }
                       }
                   }
            }
        }
    }
}

struct NewProjectpage_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectpage()
    }
}
