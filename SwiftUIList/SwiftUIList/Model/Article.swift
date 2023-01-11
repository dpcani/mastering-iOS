//
//  Artcile.swift
//  SwiftUIList
//
//  Created by Marble Interactive SL on 11/1/23.
//

import SwiftUI

struct Article: Identifiable {
    var id: UUID = UUID()
    var image: String
    var category: String
    var heading: String
    var author: String
    var rate: Int
    var excerpt: String
    
}

#if DEBUG

let cardArticles =  [
    Article(image: "flutter-app", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon", rate: 4, excerpt: "With SwiftUI, you can easily draw a border around a button or text (and it actually works for all views) using the border modifier."),
    Article(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos", rate: 5, excerpt: "Today we are going to focus on a commonly used family of controls which are vital to every application. Their primary purpose is to gather user input as well as to display certain message types to users. We are going to talk about text controls."),
    Article(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan", rate: 4, excerpt: "Hello there! Welcome to the second tutorial of our Flutter series. In the last tutorial, you learned the basics of building a Flutter app. So if you have not gone through it, please take a pit stop here, visit it first before proceeding with this tutorial."),
    Article(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati", rate: 5, excerpt: "2 years ago, at WWDC 2017, Apple released the Vision framework, an amazing, intuitive framework that would make it easy for developers to add computer vision to their apps.")

]

#endif
