//
//  fakeSearchIcon.swift
//  SWIFT GROUP PROJECT FOR GROUPS
//
//  Created by user on 6/9/23.
//

import SwiftUI

struct fakeSearchIcon: View {
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 275)
                    .frame(height: 45)
                    .opacity(0.1)
                    .cornerRadius(109)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding()
                        
                    Text("Search")
                }
            }
            .offset(x: 10)
            
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
                .foregroundColor(.black)
                .padding()
        }
    }
}

struct fakeSearchIcon_Previews: PreviewProvider {
    static var previews: some View {
        fakeSearchIcon()
    }
}
