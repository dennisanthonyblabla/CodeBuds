//
//  Articlepage.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 21/07/22.
//

import SwiftUI

struct ArticleViewModel {
    
}

struct Articlepage: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.dismiss) var dismiss
    
    @StateObject var selectedProject: UProjects
    
//    init(selectedProject:UProjects) {
//        _selectedProject = StateObject(wrappedValue: selectedProject)
//    }
    
    var body: some View {
        
//        NavigationView {
            ZStack {
                Color("BGColor").ignoresSafeArea()
                VStack (alignment: .leading) {
                    Group {
                        HStack {
                            Text(selectedProject.projectName ?? "unknown")
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
                            HStack {
                                VStack (alignment: .leading) {
                                    ArticleSubHeader(text: "Framework")
                                    Articlebody(text:selectedProject.framework ?? "unknown")
                                        .padding(.top, -10)
                                    ArticleSubHeader(text: "Author")
                                        .padding(.top, 20)
                                    Articlebody(text: "John Doe")
                                        .padding(.top, -10)
                                    ArticleSubHeader(text: "Learning Objectives")
                                        .padding(.top, 20)
                                    Articlebody(text: selectedProject.learningObjectives ?? "unknown")
                                        .padding(.top, -10)
                                    ArticleSubHeader(text:"Project Description")
                                        .padding(.top, 20)
                                    Articlebody(text: selectedProject.projectDescription ?? "unknown")
                                        .padding(.top, -10)
                                    ArticleSubHeader(text: "Contact Detail")
                                        .padding(.top, 20)
                                    Articlebody(text: selectedProject.contactNumber ?? "unknown")
                                        .padding(.top, -10)

                                }
                                Spacer()
                            } .padding(20)
                        }
                    } .padding(EdgeInsets(top: 7, leading: 15, bottom: 20, trailing: 15))
                }
                .navigationBarTitleDisplayMode(.inline)
                   .toolbar {
                       ToolbarItem(placement: .navigationBarLeading) {
                           Button (role: .none){
                               print("clicked")
//                               dismiss()
                               presentationMode.wrappedValue.dismiss()
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
                       
                       ToolbarItem(placement: .navigationBarTrailing) {
                           if selectedProject.isOwner {
                           Button (role: .none){
                               print("Deleted")
//                               dismiss()
                               try? moc.delete(selectedProject)
                               presentationMode.wrappedValue.dismiss()
                           } label: {
                               Text("Delete")
                                   .font(.custom("Avenir Medium", size: 18))
                                   .foregroundColor(Color("DarkGray"))
                           }
                           }
                       }
                   }
                   .navigationBarBackButtonHidden(true)
            }
//        }
    }
}

//struct Articlepage_Previews: PreviewProvider {
//    static var previews: some View {
//        let context = DataController.shared.container.viewContext
//
//        Articlepage(selectedProject: UProjects(), isOwner: true)
//            .environment(\.managedObjectContext, context)
//    }
//}
