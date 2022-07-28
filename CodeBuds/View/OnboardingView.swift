//
//  OnboardingView.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 28/07/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("author") private var author: String = ""
    
    var body: some View {
            
            // #1
        VStack (alignment: .center){
            Spacer(minLength: 300)
            Text("Welcome To CodeBuds")
                .font(.custom("Avenir Heavy", size: 28))
            Spacer(minLength: 30)
            Text("Please Register Your Name:")
                .font(.custom("Avenir", size: 22))
            Spacer(minLength: 30)
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color("BGColor"))
                TextField("Your Name", text: $author)
                    .font(.custom("Avenir", size: 18))
                    .foregroundColor(Color("DarkGray"))
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 0))
            } .padding(EdgeInsets(top: 0, leading: 45, bottom: 110, trailing: 45))
                
//                .background(Color("BGColor"))

            
            
                
                // #2
                OnboardingButton()
            }
            .background(Color("DarkGray"))
            .foregroundColor(Color("BGColor"))
//            .ignoresSafeArea(.all, edges: .all)
    }
}

struct OnboardingButton: View {
    // #1
        @AppStorage("needsAppOnboarding") var needsAppOnboarding: Bool = true
        
        var body: some View {
            GeometryReader { proxy in
                LazyHStack {
                    Button(action: {
                        
                        // #2
                        needsAppOnboarding = false
                    }) {
                        Text("Finish Setup")
                        .padding(.horizontal, 40)
                        .padding(.vertical, 15)
                        .font(.custom("Avenir Heavy", size: 20))
                    }
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(40)
                    .frame(minWidth: 0, maxWidth: proxy.size.width-40)
                }
                .frame(width: proxy.size.width, height: proxy.size.height/1.5)
            }
        }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
