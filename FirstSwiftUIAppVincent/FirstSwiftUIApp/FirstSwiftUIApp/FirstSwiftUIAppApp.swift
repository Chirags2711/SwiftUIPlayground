//
//  FirstSwiftUIAppApp.swift
//  FirstSwiftUIApp
//
//  Created by Chirag Sharma on 22/10/23.
//

//Folder in blue contains config info and how our App will be compiled, etc.

import SwiftUI

@main
struct FirstSwiftUIAppApp: App { //conforms to a protocol called app
    var body: some Scene { //returns some kind of scene
        WindowGroup { //Here, Scene is something called a WindowGroup
//            MovieView(movie: .mock) //We need to change here as well
//            MovieView(movies: .mock)
            MovieView()
        }
    }
}
