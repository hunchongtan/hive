import SwiftUI

struct GroupTabsView: View {
    @Binding var setOpaque: Bool
    
    var image: String = "404"
    var title: String = "Default Title"
    var desc: String = "Default Description"
    var members: Int = 0
    
    func group(image: String, title: String, desc: String, members: Int, imageOpacity: Bool) -> some View {
        
        NavigationLink(destination: ExternalFileFormat()) {
            ZStack {
                GeometryReader { geometry in
                    Image("\(image)")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 160)
                        .cornerRadius(20)
                        .blur(radius: 2)
                        .opacity(imageOpacity ? 1 : 0)
                    Rectangle()
                        .fill(Color.black)
                        .opacity(0.5)
                        .frame(height: 160)
                        .cornerRadius(20)
                        .opacity(imageOpacity ? 1 : 0)
                }
                .frame(height: 160)
                .clipped()
                
                VStack(alignment: .leading) {
                    Text(title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .opacity(imageOpacity ? 1 : 0)
                    
                    Text(desc)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 3)
                        .opacity(imageOpacity ? 1 : 0)
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text("\(members)")
                        .foregroundColor(.white)
                        .opacity(imageOpacity ? 1 : 0)
                    
                    Image(systemName: "person.2.fill")
                        .foregroundColor(.white)
                        .opacity(imageOpacity ? 1 : 0)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
            .padding(.horizontal)
        }
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            
            Text("Hives")
                .bold()
                .foregroundColor(.gray)
                .font(.system(size: 30))
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 5, trailing: 0))
            VStack(alignment: .center) {
                
                group(image: "kpop", title: "Kpop", desc: "Join our exciting events and connect with like-minded people ", members: 8526, imageOpacity: true)
                
                group(image: "JJBA", title: "Anime", desc: "For people looking to find more people to go to conventions with or to just simply discuss anime", members: 9122, imageOpacity: true)
                
                group(image: "valorant", title: "Valorant", desc: "Interest Group for people looking to join local tournaments or finding squads", members: 3314, imageOpacity: true)
                
                group(image: "art", title: "Art", desc: "Join and share your creations, organise meetups or maybe find groups to participate in exhibitions with!", members: 664, imageOpacity: true)
                
                group(image: "Food", title: "Foodies", desc: "For Food", members: 1, imageOpacity: setOpaque)
            }
        }
        Spacer()
    }
}

struct GroupDetailPage: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .padding()
            
            Text(description)
                .font(.headline)
                .padding()
        }
        .navigationBarTitle(title)
    }
}

struct GroupTabsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupTabsView(setOpaque: .constant(false))
    }
}
