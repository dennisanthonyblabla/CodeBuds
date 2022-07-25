//
//  Home+ProfilePage.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 22/07/22.
//

import SwiftUI

struct Home_ProfilePage: View {
    var body: some View {
        TabView {
            Homepage()
                .tabItem {
                    Label("Projects", systemImage: "doc.plaintext.fill")
                }
            Profilepage()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
        }
    }
}

struct Home_ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        Home_ProfilePage()
    }
}
