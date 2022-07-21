//
//  FontFormat.swift
//  CodeBuds
//
//  Created by Dennis Anthony on 21/07/22.
//
import SwiftUI
import Foundation

func ArticleSubHeader(text: String) -> Text {
    Text(text)
        .fontWeight(.heavy)
        .foregroundColor(Color("DarkGray"))
        .font(.custom("Avenir", size: 20))
}

func Articlebody(text: String) -> Text {
    Text(text)
        .fontWeight(.regular)
        .foregroundColor(Color("DarkGray"))
        .font(.custom("Avenir", size: 16))
}
