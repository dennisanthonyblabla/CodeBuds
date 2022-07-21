//
//  Homepage.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 21/07/22.
//

import SwiftUI

struct Homepage: View {
    
    @State private var searchText = ""
    
    init() {
        // Use this if NavigationBarTitle is with large font
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Avenir", size: 30)!]
    }
        
    var body: some View {
        NavigationView {
            VStack {
                List(0..<30) { item in
                    VStack (alignment: .leading) {
                        Text("Make Fake Twitter App")
                            .font(.custom("Avenir", size: 16))
                            .fontWeight(.heavy)
                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                        Text("SwiftUI")
                            .font(.custom("Avenir", size: 16))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                        Text("By John Doe")
                            .font(.custom("Avenir", size: 12))
                            .padding(.bottom, 5)
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
