//
//  Articlepage.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 21/07/22.
//

import SwiftUI

struct Articlepage: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("BGColor").ignoresSafeArea()
                VStack (alignment: .leading) {
                    Group {
                        HStack {
                            Text("Make Fake Twitter App")
                                .foregroundColor(Color("DarkGray"))
                                .padding(EdgeInsets(top: 30, leading: 15, bottom: 0, trailing: 15))
                                .font(.custom("Avenir Black", size: 30))
                            Spacer()
                        }
                        Image("TrainTrailing")
                            .renderingMode(.original)
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 5, trailing: 15))
                    }
                    ScrollView (){
                        ZStack {
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                            .fill(.white)
                                            .padding(EdgeInsets(top: 7, leading: 15, bottom: 0, trailing: 15))
                            VStack (alignment: .leading) {
                                ArticleSubHeader(text: "Framework")
                                    .padding(EdgeInsets(top: 30, leading: 35, bottom: 1, trailing: 35))
                                Articlebody(text: "SwiftUI")
                                    .padding(EdgeInsets(top: 0, leading: 35, bottom: 5, trailing: 35))
                                ArticleSubHeader(text: "Author")
                                    .padding(EdgeInsets(top: 25, leading: 35, bottom: 1, trailing: 35))
                                Articlebody(text: "John Doe")
                                    .padding(EdgeInsets(top: 0, leading: 35, bottom: 5, trailing: 35))
                                ArticleSubHeader(text: "Learning Objectives")
                                    .padding(EdgeInsets(top: 25, leading: 35, bottom: 1, trailing: 35))
                                Articlebody(text: "SwiftUI, MVVM, TableView")
                                    .padding(EdgeInsets(top: 0, leading: 35, bottom: 5, trailing: 35))
                                ArticleSubHeader(text:"Project Description")
                                    .padding(EdgeInsets(top: 25, leading: 35, bottom: 1, trailing: 35))
                                Articlebody(text: "To make a working twitter app using firebase as backend. Learning to apply MVVM as desing pattern in coding. Tableview will also be discussed")
                                    .padding(EdgeInsets(top: 0, leading: 35, bottom: 5, trailing: 35))
                                ArticleSubHeader(text: "Contact Detail")
                                    .padding(EdgeInsets(top: 25, leading: 35, bottom: 1, trailing: 35))
                                Articlebody(text: "8888888888888888 (WA Only)")
                                    .padding(EdgeInsets(top: 0, leading: 35, bottom: 30, trailing: 35))

                            }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                   .toolbar {
                       ToolbarItem(placement: .navigation) {
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

struct Articlepage_Previews: PreviewProvider {
    static var previews: some View {
        Articlepage()
    }
}
