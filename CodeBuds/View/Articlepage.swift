//
//  Articlepage.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 21/07/22.
//

import SwiftUI
import CloudKit

struct ArticleViewModel:Hashable {
    
    let record: CKRecord

}

struct Articlepage: View {
    
    let publicDatabase = CKContainer.default().publicCloudDatabase
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.dismiss) var dismiss
    @StateObject private var vm = CloudKitVariables()
    
    var record: CKRecord
    
    
//    @StateObject var selectedProject: UProjects
    
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
                            Text(record["ProjectName"] as? String ?? "")
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
                                    Articlebody(text:record["framework"] as? String ?? "")
                                        .padding(.top, -10)
                                    ArticleSubHeader(text: "Author")
                                        .padding(.top, 20)
                                    Articlebody(text: "John Doe")
                                        .padding(.top, -10)
                                    ArticleSubHeader(text: "Learning Objectives")
                                        .padding(.top, 20)
                                    Articlebody(text: record["learningObjectives"] as? String ?? "")
                                        .padding(.top, -10)
                                    ArticleSubHeader(text:"Project Description")
                                        .padding(.top, 20)
                                    Articlebody(text: record["projectDescription"] as? String ?? "")
                                        .padding(.top, -10)
                                    ArticleSubHeader(text: "Contact Detail")
                                        .padding(.top, 20)
                                    Articlebody(text: record["contactNumber"] as? String ?? "")
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
                           Button {
                               deleteItem()
//                               dismiss()
                               vm.fetchItems()
                               dismiss()
//                               presentationMode.wrappedValue.dismiss()
                           } label: {
                               Text("Delete")
                                   .font(.custom("Avenir Medium", size: 18))
                                   .foregroundColor(Color("DarkGray"))
                           }
                       }
                   }
                   .navigationBarBackButtonHidden(true)
            }
    }
    
    func deleteItem() {
        publicDatabase.delete(withRecordID: record.recordID) { (deleteRecordID, error) in
            if error == nil {
                print("Project Deleted")
            } else {
                print("Project not Deleted")
            }
        }
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
