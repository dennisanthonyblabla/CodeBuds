//
//  Homepage.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 21/07/22.
//

import SwiftUI

struct Homepage: View {
    
    @FetchRequest(sortDescriptors: []) var projects: FetchedResults<UProjects>
    
    @State private var searchText = ""
    
    init() {
        // Use this if NavigationBarTitle is with large font
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Avenir Heavy", size: 15)!]
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Avenir Black", size: 30)!]
        UINavigationBar.appearance().backgroundColor = UIColor(Color("BGColor"))
    }
        
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
//                    List(0..<12) { project in
//                        VStack (alignment: .leading) {
//                            Text("Make fake twitter app")
//                                .font(.custom("Avenir Heavy", size: 16))
//                                .foregroundColor(Color("DarkGray"))
//                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
//                            Text("SwiftUI")
//                                .font(.custom("Avenir", size: 16))
//                                .foregroundColor(Color("DarkGray"))
//                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
//                            Text("By John Doe")
//                                .font(.custom("Avenir", size: 12))
//                                .foregroundColor(Color("LightGray"))
//                                .padding(.bottom, 5)
//                        }
///ini buat yang udah connect ke core data
                    List(projects) { project in
                        VStack (alignment: .leading) {
                            Text(project.projectName ?? "unkown")
                                .font(.custom("Avenir Heavy", size: 16))
                                .foregroundColor(Color("DarkGray"))
                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                            Text(project.framework ?? "unknown")
                                .font(.custom("Avenir", size: 16))
                                .foregroundColor(Color("DarkGray"))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                            Text("By John Doe")
                                .font(.custom("Avenir", size: 12))
                                .foregroundColor(Color("LightGray"))
                                .padding(.bottom, 5)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .searchable(text: $searchText, prompt: "What project were you looking for?")
                    .navigationTitle("Hey, User!")
                    
                }
            }
//           .toolbar {
//               ToolbarItem(placement: .bottomBar) {
//                   HStack (alignment: .center, spacing: 50
//                   ) {
//                       VStack {
//                           Image(systemName: "doc.plaintext.fill")
//                              .padding(.top, 30)
//                           Text("Projects")
//                              .font(.headline)
//                              .padding(.top, 1)
//                              .foregroundColor(Color("LightGray"))
//                       }
//                       VStack {
//                           Image(systemName: "person.crop.circle.fill")
//                               .padding(.top, 30)
//                           Text("Profile")
//                              .font(.headline)
//                              .padding(.top, 1)
//                              .foregroundColor(Color("LightGray"))
//                       }
//                  }
//               }
//           }
        }
    }
}


struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
