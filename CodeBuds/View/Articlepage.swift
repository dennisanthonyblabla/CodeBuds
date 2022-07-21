//
//  Articlepage.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 21/07/22.
//

import SwiftUI

struct Articlepage: View {
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                Group {
                    HStack {
                        Text("Make Fake Twitter App")
                            .fontWeight(.black)
                            .foregroundColor(Color("DarkGray"))
                            .padding(.leading, 15)
                            .font(.custom("Avenir", size: 27))
                        Spacer()
                    }
                    Image("TrainTrailing")
                        .renderingMode(.original)
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                }
                ScrollView (){
                    VStack (alignment: .leading) {
                        ArticleSubHeader(text: "Framework")
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 3, trailing: 15))
                        Articlebody(text: "SwiftUI")
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 5, trailing: 15))
                        ArticleSubHeader(text: "Author")
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 3, trailing: 15))
                        Articlebody(text: "John Doe")
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 5, trailing: 15))
                        ArticleSubHeader(text: "Learning Objectives")
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 3, trailing: 15))
                        Articlebody(text: "SwiftUI, MVVM, TableView")
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 5, trailing: 15))
                        ArticleSubHeader(text:"Project Description")
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 3, trailing: 15))
                        Articlebody(text: "To make a working twitter app using firebase as backend. Learning to apply MVVM as desing pattern in coding. Tableview will also be discussed")
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 5, trailing: 15))
                        ArticleSubHeader(text: "Contact Detail")
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 3, trailing: 15))
                        Articlebody(text: "8888888888888888 (WA Only)")
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 5, trailing: 15))

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
