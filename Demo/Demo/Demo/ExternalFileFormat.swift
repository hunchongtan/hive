import SwiftUI

struct ExternalFileFormat: View {
    
    
    var body: some View {
        ScrollView {
            VStack {
                IntroSection(title: "Welcome to Kpop", introduction: "Join our exciting events and connect with like-minded people", backgroundImageName: "intro_background")
                
                EventRecruitmentSection(title: "FiftyFifty Concert", location: "Malaysia, Singapore", description: "Come and see your favorite Kpop Group this coming September!", time: "12:00 PM - 2:00 PM", participants: 25, date: "September 15, 2023", backgroundImageName: "event1_background")
                
                EventRecruitmentSection(title: "Twice : Ready To Be", location: "Singapore, Malaysia", description: "Come and see one of the most popular groups this coming October with us!", time: "3:00 PM - 5:00 PM", participants: 30, date: "October 10, 2023", backgroundImageName: "event2_background")
                
                EventRecruitmentSection(title: "New Jeans Concert", location: "Singapore, Malaysia", description: "Come and see an up and coming Kpop group with us this coming October!", time: "3:00 PM - 5:00 PM", participants: 30, date: "October 10, 2023", backgroundImageName: "event3_background")
            }
            .padding()
        }
        .navigationBarTitle("Events")
    }
}

struct EventRecruitmentSection: View {
    var title: String
    var location: String
    var description: String
    var time: String
    var participants: Int
    var date: String
    var backgroundImageName: String

    @State private var containerHeight: CGFloat = 200
    @State var popUp = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(backgroundImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: containerHeight)
                    .clipped()
                    .opacity(0.2)

                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)

                    Text(location)
                        .font(.subheadline)
                        .foregroundColor(.black)

                    Text(description)
                        .font(.body)

                    HStack {
                        Text("Time: \(time)")
                            .font(.subheadline)

                        Spacer()

                        Text("Participants: \(participants)")
                            .font(.subheadline)
                    }

                    Text("Date: \(date)")
                        .font(.subheadline)

                    Button("Participate") {
                        popUp = true
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .alert(isPresented: $popUp) {
                                Alert(
                                    title: Text("Joined Successfully"),
                                    message: Text("Thank you for joining. I will be in contact with you in a few days"),
                                    primaryButton: .default(Text("OK")) {
                                    },
                                    secondaryButton: .cancel(Text("Cancel")) {

                                    }
                                )
                            }
                }
                .padding()
            }
            .background(Color.gray.opacity(0.9))
            .cornerRadius(10)
            .shadow(radius: 5)
        }
        .frame(height: containerHeight)
        .onAppear {
            // Adjust containerHeight based on the desired content height
            containerHeight = 300 // You can set this to the desired height
        }
    }
}

struct IntroSection: View {
    var title: String
    var introduction: String
    var backgroundImageName: String

    var body: some View {
        ZStack {
            Image(backgroundImageName)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
                .opacity(0.5)

            VStack(alignment: .leading, spacing: 20) {
                Text(title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)

                Text(introduction)
                    .font(.headline)
                    .padding()
                    .background(Color.white.opacity(0.3))
                    .border(Color.gray, width: 1)
                    .cornerRadius(10)
            }
            .padding()
        }
        .background(Color.white.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ExternalFileFormat_Previews: PreviewProvider {
    static var previews: some View {
        ExternalFileFormat()
    }
}
