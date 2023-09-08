//
//  InitiateView.swift
//  SWIFT GROUP PROJECT FOR GROUPS
//
//  Created by user on 6/9/23.
//

import SwiftUI

struct InitiateView: View {
    @State private var selectedTab = 0
    @Binding var setOpaque: Bool
    
    var body: some View {
        VStack (alignment: .center) {
            HStack {
                Picker(selection: $selectedTab, label: Text("")) {
                    Text("Groups").tag(0)
                    Text("Events").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .frame(width: 250)
                
                Image("HiveIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .foregroundColor(.black)
                    .padding()
            }
            
            // Content for the selected tab
            VStack {
                if selectedTab == 0 {
                    InitiateGroupsView(setOpaque: $setOpaque)
                } else {
                    InitiateEventsView()
                }
                
                Spacer()
            }
        }
            .padding()
        }}

struct InitiateView_Previews: PreviewProvider {
    static var previews: some View {
        InitiateView(setOpaque: .constant(false))
    }
}
