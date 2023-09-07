//
//  InitiateGroupsView.swift
//  SWIFT GROUP PROJECT FOR GROUPS
//
//  Created by user on 6/9/23.
//

import SwiftUI

struct InitiateGroupsView: View {
    @State private var isPrivOn: Bool = false
    @State private var isToggleOn: Bool = false
    @State private var fakeDesc: String = ""
    @State private var fakeTitle: String = ""
    @State private var fakePass: String = ""
    @State private var eyePacity: Bool = false
    @State private var valCheck: Bool = false
    @Binding var setOpaque: Bool
    
    var body: some View {
        VStack {
            ZStack {
                // Change to image later
                Rectangle()
                    .fill(Color(UIColor.lightGray))
                    .frame(maxWidth: 360)
                    .frame(maxHeight: 160)
                    .cornerRadius(20)
                    .blur(radius: 2)
                
                Image("Food")
                    .frame(maxWidth: 360)
                    .frame(maxHeight: 160)
                    .cornerRadius(20)
                    .blur(radius: 2)
                    .opacity(valCheck ? 1 : 0)
                
                Rectangle()
                    .fill(.black)
                    .opacity(0.5)
                    .frame(maxWidth: 360)
                    .frame(maxHeight: 160)
                    .cornerRadius(20)
                
                HStack {
                    VStack (alignment: .leading) {
                        ZStack {
                            Text("Group Name")
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .offset(x: -46, y: 0)
                                .opacity(fakeTitle.isEmpty ? 1 : 0)
                            
                            TextField("", text: $fakeTitle)
                                .fontWeight(.heavy)
                                .offset(x: 64)
                                .foregroundColor(.white)
                        }
                        
                        ZStack {
                            Rectangle()
                                .fill(Color(UIColor.lightGray))
                                .frame(maxWidth: 270)
                                .frame(maxHeight: 80)
                                .cornerRadius(20)
                                .offset(x: 30)
                            
                            Text("Group Description")
                                .foregroundColor(.white)
                                .offset(x: -19, y: -15)
                                .opacity(fakeDesc.isEmpty ? 1 : 0)
                            
                            TextField("", text: $fakeDesc)
                                .foregroundColor(.white)
                                .offset(x: 74)
                                .offset(y: -15)
                            
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
            
            VStack {
                HStack {
                    Text("Configurations")
                        .offset(x:25)
                        .bold()
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                
                Toggle(isOn: $isPrivOn) {
                    Text("Make group private")
                }
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                
                if isPrivOn == true {
                    ZStack {
                        Rectangle()
                            .fill(Color(UIColor.lightGray))
                            .frame(width: 350, height: 50)
                            .cornerRadius(20)
                        
                        Text("Set Password")
                            .foregroundColor(.white)
                            .opacity(fakePass.isEmpty ? 1 : 0)
                            .offset(x: -94)
                        
                        SecureField("", text: $fakePass)
                            .offset(x: 50)
                            .foregroundColor(eyePacity ? Color(UIColor.lightGray) : .black)
                        
                        HStack {
                            Text(fakePass)
                                .foregroundColor(.white)
                                .opacity (eyePacity ? 1 : 0)
                                .offset(x: 50)
                            
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                self.eyePacity.toggle()
                            }) {
                                
                                Image(systemName: "eye")
                                    .foregroundColor(.white)
                                    .imageScale(.large)
                            }
                            .offset(x: -40)
                        }
                    }
                }
                
                Toggle(isOn: $isToggleOn) {
                    Text("Hide group in Search")
                }
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                
                Button("Create") {
                    setOpaque.toggle()
                }
                
                
            }
            
            Spacer()
        }
        
        Spacer()
    }
}


struct InitiateGroupsView_Previews: PreviewProvider {
    static var previews: some View {
        InitiateGroupsView(setOpaque: .constant(false))
    }
}
