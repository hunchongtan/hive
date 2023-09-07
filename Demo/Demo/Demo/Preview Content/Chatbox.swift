//
//  Chatbox.swift
//  SWIFT GROUP PROJECT FOR GROUPS
//
//  Created by user on 5/9/23.
//

import SwiftUI

struct Chatbox: View {
    @State var likeCount = 0
    
    func Like() {
        if (likeCount == 0) {
            likeCount += 1
        }
        else {
            likeCount -= 1
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Sample Title")
                .bold()
            Text("location | date | timing")
                .foregroundColor(Color.gray)
            Text("Testing")
                .padding(.vertical, 100)
                .padding(.horizontal, 150)
                .background(Color(UIColor.lightGray))
                .cornerRadius(20)
            
            HStack {
                Button(action: {
                    Like()
                }) {
                    if (likeCount == 0) {
                        Image(systemName: "heart")
                            .imageScale(.large)
                            .foregroundColor(.black)
                            .offset(x: 5)
                    }
                        
                    else {
                        Image(systemName: "heart.fill")
                            .imageScale(.large)
                            .foregroundColor(.red)
                            .offset(x: 5)
                    }
                }
            }
            Spacer()
        }
    }
}
//Button("Button title") { print("Button tapped!") }

struct Chatbox_Previews: PreviewProvider {
    static var previews: some View {
        Chatbox()
    }
}
