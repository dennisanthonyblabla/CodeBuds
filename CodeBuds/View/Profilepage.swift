//
//  Profilepage.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 25/07/22.
//

import SwiftUI

struct Profilepage: View {
    
    @State private var showingCreate = false
    
    init() {
        // Use this if NavigationBarTitle is with large font
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Avenir Heavy", size: 15)!]
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Avenir Black", size: 30)!]
        UINavigationBar.appearance().backgroundColor = UIColor(Color("BGColor"))
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BGColor").ignoresSafeArea()
                
                List(0..<5) { item in
                    VStack (alignment: .leading) {
                        Text("Making Project")
                            .font(.custom("Avenir Heavy", size: 16))
                            .foregroundColor(Color("DarkGray"))
                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                        Text("UIkit")
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
                
                    .navigationTitle("Your Projects")
                    .navigationBarTitleDisplayMode(.large)
                       .toolbar {
                           ToolbarItem(placement: .navigationBarTrailing) {
                               VStack {
                                   Button {
                                       print("clicked")
                                       showingCreate.toggle()
                                   } label: {
                                          Image(systemName: "square.and.pencil")
                                              .resizable()
                                              .scaledToFit()
                                              .frame(width: 25, height: 25)
    //                                          .padding(.top, 85)
                                   } .sheet(isPresented: $showingCreate) {
                                       NewProjectpage()
                               }
                               }
                           }
                       }
            }
        }
    }
}

struct Profilepage_Previews: PreviewProvider {
    static var previews: some View {
        Profilepage()
    }
}
