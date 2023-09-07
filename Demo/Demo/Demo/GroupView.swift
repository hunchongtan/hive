//
//  GroupView.swift
//  SWIFT GROUP PROJECT FOR GROUPS
//
//  Created by user on 6/9/23.
//

import SwiftUI

struct GroupView: View {
    @Binding var setOpaque: Bool
    var body: some View {
        NavigationStack {
            ScrollView {
                fakeSearchIcon()
                GroupTabsView(setOpaque: $setOpaque)
            }
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView(setOpaque: .constant(false))
    }
}
