//
//  EventTabsView.swift
//  SWIFT GROUP PROJECT FOR GROUPS
//
//  Created by user on 6/9/23.
//

import SwiftUI

struct EventTabsView: View {
    @State var image: String
    @State var title: String
    @State var location: String
    @State var date: String
    @State var timing: String
    @State var minParticipants: Int
    @State var maxParticipants: Int
    @State var desc: String
     
    init(image: String = "404", title: String = "Default Title", location: String = "???", date: String = "??", timing: String = "?", minParticipants: Int = 1, maxParticipants: Int = 4, desc: String = "Default Description") {
        self.image = image
        self.title = title
        self.location = location
        self.date = date
        self.timing = timing
        self.minParticipants = minParticipants
        self.maxParticipants = maxParticipants
        self.desc = desc
     }
    
    @State var likeCount = 0
    
    func Like() {
        if (likeCount == 0) {
            likeCount += 1
        }
        else {
            likeCount -= 1
        }
    }
    
    @State var joinButt: Bool = false
    
    func joinEvent() {
        if joinButt == false {
            minParticipants += 1
        }
        else {
            minParticipants -= 1
        }
        joinButt.toggle()
    }
    
    func event(image: String, title: String, location: String, date: String, timing: String, desc: String) -> some View {
         VStack (alignment: .leading) {
             HStack {
                 Image(systemName: "person.circle")
                     .resizable()
                     .scaledToFit()
                     .frame(width: 40)
                     .foregroundColor(.black)
                     .padding()
                 
                 VStack (alignment: .leading) {
                     Text(title)
                         .bold()
                     
                     Text("\(location) | \(date) | \(timing)")
                         .foregroundColor(Color.gray)
                 }
             }
            
             VStack (alignment: .leading) {
                 Image("\(image)")
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(maxWidth: 370, maxHeight: 400)
                     .edgesIgnoringSafeArea(.all)
                     .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                 
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
                     
                     Spacer()
                     
                     if joinButt == false {
                         Button("Join") {
                             joinEvent()
                         }
                     }
                     else {
                         Button("Leave") {
                             joinEvent()
                         }
                         .foregroundColor(.red)
                     }
                     
                     Text("\(minParticipants) / \(maxParticipants)")
                     
                     Image(systemName: "person.2.fill")
                     
                 }
                 
                 Text(desc)
                     .padding(EdgeInsets(top: 10, leading: 5, bottom: 0, trailing: 30))
                 
             }
             .padding()
             
             Spacer()
         }
        
        
    }
    
    var body: some View {
        event(image: "AFA", title: "Need Convention Friends", location: "SUTD Block C, Lvl 6", date: "2 Jan 2024", timing: "12pm-9pm", desc: "PLEASE JOIN I NEED TO GO WITH SOMEONE I NEED PLEASE JOIN FOR US TO GO TOGETHER PLEASEEEEE")
    }
}

struct EventTabsView_Previews: PreviewProvider {
    static var previews: some View {
        EventTabsView()
    }
}
