//
//  Homepage.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 21/07/22.
//

import SwiftUI
import CloudKit

struct Homepage: View {
    
    @FetchRequest(sortDescriptors: []) var projects: FetchedResults<UProjects>
    
    @State private var searchText = ""
    @StateObject private var vm = CloudKitVariables()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Avenir Heavy", size: 15)!]
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Avenir Black", size: 30)!, .foregroundColor:UIColor.darkGray]
        UINavigationBar.appearance().backgroundColor = UIColor(Color("BGColor"))
    }
        
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(vm.records, id: \.self) { project in
                            NavigationLink (destination: Articlepage(record: project)) {
                                VStack (alignment: .leading) {
                                    Text(project["ProjectName"] as? String ?? "")
                                        .font(.custom("Avenir Heavy", size: 16))
                                        .foregroundColor(Color("DarkGray"))
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                                    Text(project["framework"] as? String ?? "")
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
                        }
                    }
                    .refreshable{
                        vm.fetchItems()
                    }
                }
                .searchable(text: $searchText, prompt: "What project were you looking for?")
                .navigationTitle("Hey, User!")
            }
        }
    }
}


struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
