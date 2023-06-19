//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Michael Pierce on 2023-06-19.
//

import SwiftUI

struct ProfileHost: View {
    // Create a variable named editMode that reflects the current 'editMode' state
    // from the environment
    @Environment(\.editMode) var editMode
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                // EditButton controls the editMode environment variable
                EditButton()
            }
            
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    // even though this view doesn't use ModelData, the childview ProfileSummary does
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
