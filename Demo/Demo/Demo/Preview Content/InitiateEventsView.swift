//
//  InitiateGroupsView.swift
//  SWIFT GROUP PROJECT FOR GROUPS
//
//  Created by user on 6/9/23.
//

import SwiftUI

struct InitiateEventsView: View {
    @State private var isPrivOn = false
    @State private var isToggleOn = false
    @State private var fakeTitle: String = ""
    @State private var fakeLocation: String = ""
    @State private var fakeDesc: String = ""
    @State private var fakeGroupSearch: String = ""
    @State private var valCheck: Bool = false
    @State private var copyCheck: Bool = false
    @State private var tintCheck: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    // Change to image later
                    Rectangle()
                        .fill(Color(UIColor.lightGray))
                        .frame(maxWidth: 360)
                        .frame(maxHeight: 300)
                        .cornerRadius(20)
                        .blur(radius: 2)
                    
                    Image("Event")
                        .frame(maxWidth: 360)
                        .frame(maxHeight: 300)
                        .cornerRadius(20)
                        .blur(radius: 2)
                        .opacity(valCheck ? 1 : 0)
                    
                    Rectangle()
                        .fill(.black)
                        .opacity(0.5)
                        .frame(maxWidth: 360)
                        .frame(maxHeight: 300)
                        .cornerRadius(20)
                    
                    HStack {
                        VStack (alignment: .leading) {
                            
                            ZStack {
                                Text("Post Title")
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                                    .offset(x: -44, y: 0)
                                    .opacity(fakeTitle.isEmpty ? 1 : 0)
                                
                                TextField("", text: $fakeTitle)
                                    .fontWeight(.heavy)
                                    .offset(x: 78)
                                    .foregroundColor(.white)
                            }
                            
                            ZStack {
                                Text("location")
                                    .foregroundColor(Color(UIColor.lightGray))
                                    .offset(x: -55, y: -10)
                                    .opacity(fakeLocation.isEmpty ? 1 : 0)
                                
                                TextField("location", text: $fakeLocation)
                                    .offset(x: 77, y: -9)
                                    .foregroundColor(Color(UIColor.lightGray))
                            }
                            
                            ZStack {
                                Rectangle()
                                    .fill(Color(UIColor.lightGray))
                                    .frame(maxWidth: 250)
                                    .frame(maxHeight: 180)
                                    .cornerRadius(20)
                                    .offset(x: 30)
                                
                                
                                
                                ZStack {
                                    Text("Short Description")
                                        .foregroundColor(.white)
                                        .opacity(fakeDesc.isEmpty ? 1 : 0)
                                        .offset(x: -9,y: -60)
                                    
                                    TextField("", text: $fakeDesc)
                                        .foregroundColor(.white)
                                        .offset(x: 87, y: -60)
                                }
                                /*
                                 Text("Old Desc")
                                 .foregroundColor(.white)
                                 .offset(y: -60)
                                 .offset(x: 40) */
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            valCheck.toggle()
                        }) {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.white)
                                .imageScale(.large)
                        }
                        
                    }
                    .offset(x: -40)
                }
                
                HStack {
                    VStack {
                        HStack {
                            Text("Configurations")
                                .offset(x:25)
                                .bold()
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                        
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(width: 350)
                                .frame(height: 45)
                                .opacity(0.1)
                                .cornerRadius(109)
                            
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .padding()
                                
                                ZStack {
                                    TextField("Search Group", text: $fakeGroupSearch)
                                }
                            }
                            .offset(x: 20)
                        }
                        
                        if (!fakeGroupSearch.isEmpty) {
                            Button(action: {
                                tintCheck.toggle()
                            }) {
                                VStack {
                                    ZStack {
                                        Image("Valorant")
                                            .frame(maxWidth: 360)
                                            .frame(maxHeight: 160)
                                            .cornerRadius(20)
                                            .blur(radius: 2)
                                        
                                        Rectangle()
                                            .accentColor(tintCheck ? .blue : .black)
                                            .opacity(0.5)
                                            .frame(maxWidth: 360)
                                            .frame(maxHeight: 160)
                                            .cornerRadius(20)
                                        
                                        VStack {
                                            Text("Valorant")
                                                .foregroundColor(.white)
                                                .fontWeight(.heavy)
                                                .offset(x: -70, y: -30)
                                            
                                            Text("For people looking for squads")
                                                .foregroundColor(.white)
                                                .offset(y: -20)
                                            
                                            HStack {
                                                Text("1")
                                                    .foregroundColor(.white)
                                                
                                                Image(systemName: "person.2.fill")
                                                    .foregroundColor(.white)
                                            }
                                            .offset(x: 190, y: 30)
                                        }
                                        .offset(x: -50)
                                    }
                                }
                            }
                        }
                        
                        Toggle(isOn: $isPrivOn) {
                            Text("Make event invite-only")
                        }
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                        if isPrivOn == true {
                            ZStack {
                                Rectangle()
                                    .opacity(0.1)
                                    .frame(width: 350, height: 50)
                                    .cornerRadius(20)
                                
                                HStack {
                                    Text("https://hive.com/h28KAk9sm/")
                                    
                                    Button (action: {
                                        copyCheck = true
                                    }) {
                                        Image(systemName: "link.badge.plus")
                                            .offset(x: 20)
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                            
                            if copyCheck == false {
                                HStack {
                                    Text("URL Generated!")
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                }
                                .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                                
                            }
                            
                            else {
                                HStack {
                                    Text("Copied!")
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                }
                                .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                            }
                        }
                        
                        Toggle(isOn: $isToggleOn) {
                            Text("Only allow group members to join")
                        }
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                        
                        Button("Post") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .offset(y: 40)
                        
                    }
                }
                
                Spacer()
            }
        }
        
        Spacer()
    }
}


struct InitiateEventsView_Previews: PreviewProvider {
    static var previews: some View {
        InitiateEventsView()
    }
}
