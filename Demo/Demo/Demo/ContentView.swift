//
//  ContentView.swift
//  Demo
//
//  Created by user on 7/9/23.
//

import SwiftUI



struct ContentView: View {
    @State var setOpaque = false
    var body: some View {
        TabView{
            DescriptionView().tabItem {
                Label("Home", systemImage: "house.fill")
            }
            InitiateView(setOpaque: $setOpaque).tabItem {
                Label("Initiate", systemImage: "plus.app.fill")
            }
            GroupView(setOpaque: $setOpaque).tabItem {
                Label("Groups", systemImage: "person.3.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
