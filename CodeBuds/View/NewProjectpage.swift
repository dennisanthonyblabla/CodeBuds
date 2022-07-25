//
//  NewProjectpage.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 25/07/22.
//

import SwiftUI

class ProjectViewModel: ObservableObject {
    @Published var ProjectName = ""
}

struct NewProjectpage: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = ProjectViewModel()

    init() {
        // Use this if NavigationBarTitle is with large font
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
                                Text("Learning Objectives")
                                    .font(.custom("Avenir Heavy", size: 18))
                                    .padding(.top, 10)
                                Spacer()
                            }
                            TextField("e.g SwiftUI, TableView", text: $viewModel.ProjectName)
                                .font(.custom("Avenir", size: 16))
                        }
                        
                        VStack {
                            HStack {
                                Text("Project Description")
                                    .font(.custom("Avenir Heavy", size: 18))
                                    .padding(.top, 10)
                                Spacer()
                            }
                            TextField("Brief Description", text: $viewModel.ProjectName)
                                .font(.custom("Avenir", size: 16))
                        }
                        
                        VStack {
                            HStack {
                                Text("Contact Details")
                                    .font(.custom("Avenir Heavy", size: 18))
                                    .padding(.top, 10)
                                Spacer()
                            }
                            TextField("e.g Line, Whatsapp", text: $viewModel.ProjectName)
                                .font(.custom("Avenir", size: 16))
                                .padding(.bottom, 13)
                        }
                    }
                }
                
                    .navigationTitle("Create New Project")
                    .navigationBarTitleDisplayMode(.large)
                       .toolbar {
                           ToolbarItem(placement: .navigationBarTrailing) {
                               Button("Save") {
                                   print("Clicked Save")
                                   let project = UProjects(context: moc)
                                   project.projectID = UUID()
                                   project.projectName = viewModel.ProjectName
                                   
                                   
                                   try? moc.save()
                                   dismiss()
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
