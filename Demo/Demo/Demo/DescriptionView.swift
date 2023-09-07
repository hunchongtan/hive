import SwiftUI

struct Event {
    var title: String
    var details: String
    var imageName: String
}

struct DescriptionView: View {
    @State private var searchText: String = ""
    var allGroups: [Event] = [
        Event(title: "Valorant Interest Group", details: "The gun goes pew pew pew.", imageName: "valorant"),
        Event(title: "Kpop", details: "Welcome any multifandom stans!", imageName: "kpop"),
        Event(title: "Anime Interest Group", details: "Nico Nico Nii", imageName: "JJBA"),
        Event(title: "Art Interest Group", details: "I love Art.", imageName: "art"),
    ]
    
    var allEvents: [Event] = [
        Event(title: "HallyuPopFest 2023", details: "Date: 12 Nov 2023. Get to see Taeyang, Kep1er and man", imageName: "kcon"),
        Event(title: "Anime Festival Asia 2023", details: "Date: 24 - 26 Nov 2023. See you!", imageName: "afa"),
        Event(title: "Artcade", details: "Date: 1 - 3 Sep 2023. Coolest Art market and convention", imageName: "artcade"),
    ]
    
    var featuredGroups: [Event] {
        return Array(allGroups.shuffled().prefix(3))
    }
    
    var attendingEvents: [Event] {
        return Array(allEvents.shuffled().prefix(3))
    }
    
    var filteredFeaturedGroups: [Event] {
        if searchText.isEmpty {
            return featuredGroups
        } else {
            let lowercaseSearchText = searchText.lowercased()
            return featuredGroups.filter {
                $0.title.lowercased().contains(lowercaseSearchText)
            }
        }
    }
    
    var filteredAttendingEvents: [Event] {
        if searchText.isEmpty {
            return attendingEvents
        } else {
            let lowercaseSearchText = searchText.lowercased()
            return attendingEvents.filter {
                $0.title.lowercased().contains(lowercaseSearchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                VStack {
                    TextField("Search", text: $searchText)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.2)) // Background gray rectangle
                        .frame(width: geometry.size.width - 40, height: 300) // Fixed height
                        .padding(.horizontal, 20)
                        .overlay {
                            VStack {
                                Text("Featured Hives")
                                    .font(.title)
                                    .padding(.top, 20)
                                    .bold()
                                
                                // Display filtered featured groups in a ScrollView
                                ScrollView {
                                    NavigationLink( destination: ExternalFileFormat()){
                                        LazyVStack(spacing: 10) {
                                            ForEach(filteredFeaturedGroups, id: \.title) { group in
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.white)
                                                    .frame(width: geometry.size.width - 60, height: 80)
                                                    .overlay(
                                                        Image(group.imageName) // Use imageName property
                                                            .resizable()
                                                            .opacity(0.35)
                                                            .scaledToFill()
                                                            .frame(width: geometry.size.width - 60, height: 80)
                                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                                            .overlay(
                                                                VStack {
                                                                    Text(group.title)
                                                                        .font(.headline)
                                                                        .padding(.bottom, 5)
                                                                    
                                                                    Text(group.details)
                                                                        .font(.subheadline)
                                                                }
                                                                    .padding()
                                                                    .foregroundColor(.black)
                                                            )
                                                    )
                                            }
                                        }
                                    }
                                        .padding(.horizontal, 20)
                                        .padding(.bottom, 20) // Add padding to the bottom of the content scroll view
                                    }
                                }
                            }
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.gray.opacity(0.2)) // Background gray rectangle
                                .frame(width: geometry.size.width - 40, height: 300) // Fixed height
                                .padding(.horizontal, 20)
                                .overlay {
                                    VStack {
                                        Text("My Buzzes")
                                            .font(.title)
                                            .padding(.top, 20)
                                            .bold()
                                        
                                        // Display filtered attending events in a ScrollView
                                        ScrollView {
                                            LazyVStack(spacing: 10) {
                                                ForEach(filteredAttendingEvents, id: \.title) { event in
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .fill(Color.white)
                                                        .frame(width: geometry.size.width - 60, height: 80)
                                                        .overlay(
                                                            Image(event.imageName) // Use imageName property
                                                                .resizable()
                                                                .opacity(0.35)
                                                                .scaledToFill()
                                                                .frame(width: geometry.size.width - 60, height: 80)
                                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                                .overlay(
                                                                    VStack {
                                                                        Text(event.title)
                                                                            .font(.headline)
                                                                            .padding(.bottom, 5)
                                                                        
                                                                        Text(event.details)
                                                                            .font(.subheadline)
                                                                    }
                                                                        .padding()
                                                                        .foregroundColor(.black)
                                                                )
                                                        )
                                                }
                                            }
                                            .padding(.horizontal, 20)
                                            .padding(.bottom, 20) // Add padding to the bottom of the content scroll view
                                        }
                                    }
                                }
                        }
                }
            
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
