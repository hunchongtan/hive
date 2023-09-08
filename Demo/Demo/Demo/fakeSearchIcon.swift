import SwiftUI

struct fakeSearchIcon: View {
    @State private var searchText: String = ""

    var body: some View {
        VStack {
            TextField("Search", text: $searchText)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.top, 20)
        }
        .navigationBarTitle("")
    }
}

struct fakeSearchIcon_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            fakeSearchIcon()
        }
    }
}
